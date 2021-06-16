import 'package:events/core/locator.dart';
import 'package:events/services/firebase_auth.dart';
import 'package:events/views/loginscreen/loginscreen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupscreenViewModel extends BaseViewModel {
  Logger log;

  String email, password, username;
  final _navService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  var passwordVisible = true;
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  setStatePasswordVisible() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  Future provideRegisteration() async {
    try {
      var reg =
          await AuthService().registerUser(email, password).then((_) async {
        await _.user.updateProfile(displayName: username);
        await _.user.sendEmailVerification().then((_) {
          _snackbarService.showSnackbar(
              message: "Please check verification email", title: "Email Sent");
        });
        _snackbarService.showSnackbar(
            message: "Tap here to login",
            title: "User Registered",
            onTap: navigateToLoginScreen());
      }).catchError((err) {
        _snackbarService.showSnackbar(
            message: (err.message == null)
                ? "All fields must be filled"
                : err.message.toString(),
            title: "Error");
      });

      return reg;
    } on FirebaseAuthException catch (e) {
      _snackbarService.showSnackbar(
        message: e.message.toString(),
        title: "Error",
      );
      return e.message;
    }
  }

  navigateToLoginScreen() {
    _navService.navigateToView(LoginscreenView());
  }

  SignupscreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
