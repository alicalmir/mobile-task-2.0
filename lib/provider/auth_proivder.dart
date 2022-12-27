import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_task/screens/nav_button_page.dart';
import 'package:mobile_task/utils/dialog.dart';
import 'package:mobile_task/utils/loading_action.dart';
import '../model/user_mdel.dart';
import '../screens/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream get user => _auth.authStateChanges();

  /// Google signIn
  Future googleSignIn(BuildContext context) async {
    final navigator = Navigator.of(context);
    try {
      final GoogleSignInAccount? user = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await user?.authentication;

      final signIn = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      final UserCredential userCredential =
          await _auth.signInWithCredential(signIn);
      if (userCredential.user != null) {
        UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
        );
        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(userModel.toJson());
        navigator
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      showpopDialog(context: context, data: e.toString());
    }
  }

  /// facebook auth
  Future facebookSignIn(BuildContext context) async {
    final navigator = Navigator.of(context);
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential authCredentials =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      final UserCredential userCredential =
          await _auth.signInWithCredential(authCredentials);
      if (userCredential.user != null) {
        UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
        );
        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(userModel.toJson());

        navigator
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
      }
    } on FirebaseException catch (e) {
      showpopDialog(context: context, data: e.toString());
    }
  }

  /// email and password
  Future emailPasswordAuth({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final navigator = Navigator.of(context);
    try {
      showLoadingDialog(context);
      final user = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      if (user.user != null) {
        UserModel userModel = UserModel(
          id: user.user!.uid,
          name: name,
          email: email,
        );
        await _firestore
            .collection('users')
            .doc(user.user!.uid)
            .set(userModel.toJson());
        navigator.pop();
        navigator.push(
            MaterialPageRoute(builder: (context) => const NavButtonHome()));
      }
    } on FirebaseAuthException catch (e) {
      navigator.pop();
      showpopDialog(context: context, data: e.toString());
    }
  }
}
