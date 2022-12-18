import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../model/user_mdel.dart';
import '../screens/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Stream get user =>_auth.authStateChanges();

  /// Google signIn
  Future googleSignIn(BuildContext context) async {
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      // you can show a snackBar here if there is error
    }
  }

  /// facebook auth
  Future facebookSignIn(BuildContext context) async {
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

/// email and password
  Future emailPasswordAuth({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      if (user.user != null) {
        UserModel userModel = UserModel(
          id: user.user!.uid,
          name: user.user!.displayName!,
          email: user.user!.email!,
        );
        await _firestore
            .collection('users')
            .doc(user.user!.uid)
            .set(userModel.toJson());
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }
}
