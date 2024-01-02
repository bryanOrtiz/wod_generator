library firebase_auth_api;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// A FirebaseAuthApi.
class FirebaseAuthApi {
  const FirebaseAuthApi({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  Stream<User?> get user => firebaseAuth.authStateChanges();

  Future<void> signUp({required String email, required String password}) =>
      firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

  Future<void> logInWithGoogle() async {
    late final AuthCredential credential;
    if (kIsWeb) {
      final googleProvider = GoogleAuthProvider();
      final userCredential = await firebaseAuth.signInWithPopup(
        googleProvider,
      );
      credential = userCredential.credential!;
    } else {
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
    }

    await firebaseAuth.signInWithCredential(credential);
  }

  Future<void> logOut() => Future.wait([
        firebaseAuth.signOut(),
        googleSignIn.signOut(),
      ]);
}
