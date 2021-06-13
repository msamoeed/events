import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/core/locator.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:crypto/crypto.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';


import 'package:stacked_services/stacked_services.dart';

class AuthService {
  static Future<User> get currUID async => FirebaseAuth.instance.currentUser;

  static String get testUid => '5VArbfpanyYWLdrN2daMNcbSAX93';

  static bool appleSignInAvailable = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var _auth = FirebaseAuth.instance;
  final _snackbarService = locator<SnackbarService>();


  Future<UserCredential> registerUser(email, password) async {
    var _res = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await insertUserCollection();

    return _res;
  }

  Future<UserCredential> emailAuth(email, password) async {
    var _user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    if (!_user.user.emailVerified) _user.user.sendEmailVerification();
    return _user;
  }

  Future<UserCredential> googleAuth() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    insertUserCollection();
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> appleAuth() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
  var val = await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    insertUserCollection();

    return val;
  }

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  insertUserCollection() async {

   
    if  (await checkIfDocExists(_auth.currentUser.uid) == false){

     FirebaseFirestore.instance.collection('users').doc(_auth.currentUser.uid).set({
          'uid': _auth.currentUser.uid,
          'type': 'customer',
        })
        .then((value) => _snackbarService.showSnackbar(message: "You are now logged in", title: "Login Successful"))
        .catchError((error) => _snackbarService.showSnackbar(message: error.message.toString(), title: "Error"));
    }
  }

  Future<bool> checkIfDocExists(String docId) async {
    try {
      // Get reference to Firestore collection
      var collectionRef = FirebaseFirestore.instance.collection('users');

      var doc = await collectionRef.doc(docId).get();
      return doc.exists;
    } catch (e) {
      throw e;
    }
  }
}

main(List<String> args) {
  // var reg = await AuthService()
  //     .registerUser("zeeshanhamdani98@gmail.com", "871sj1239?");
  print("Hello World");
}
