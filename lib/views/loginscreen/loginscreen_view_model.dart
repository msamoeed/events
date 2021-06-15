import 'package:events/core/locator.dart';
import 'package:events/services/firebase_auth.dart';
import 'package:events/views/bottom_bar/bottom_bar_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginscreenViewModel extends BaseViewModel {
  Logger log;
  var passwordVisible = true;
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  bool checkedValue = false;
  String email, password;
  String uid;

  final _navService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  setStatePasswordVisible() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  Future provideEmailSign() async {
    if (email != null && password != null) {
      try {
        var user = await AuthService().emailAuth(email, password);
        if (user.user.emailVerified) {
          _navService.navigateToView(BottomBarView());
        } else
          _dialogService.showDialog(
              title: "Email not verified",
              description:
                  "Please check your email for verification email. And click the link in the email.");
      } on FirebaseAuthException catch (_) {
        _dialogService.showDialog(
            title: "Something went wrong.", description: _.message);
      }
    }
  }

  Future provideGoogleSign() async {
    try {
      var uc = await AuthService().googleAuth();
      uid = uc.user.uid;
      // _navService.navigateTo();
      print(uid);
      _navService.navigateToView(BottomBarView());
    } on FirebaseAuthException catch (e) {
      _dialogService.showDialog(
        title: "Error",
        description: e.message,
        barrierDismissible: false,
      );
    }
  }

  Future provideAppleSign() async {
    try {
      var uc = await AuthService().appleAuth();
      print(uc.user.uid);
      _navService.navigateToView(BottomBarView());
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  LoginscreenViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
