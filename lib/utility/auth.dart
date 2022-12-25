import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halal_scan/models/user.dart';

class AuthService extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  CustomUser? customUserFromFirebase(User? user) {
    return user != null
        ? CustomUser(
            uid: user.uid,
            fullName: user.displayName,
            photoUrl: user.photoURL,
            email: user.email,
          )
        : null;
  }

  Stream<CustomUser?> get authUser {
    return firebaseAuth.authStateChanges().map(customUserFromFirebase);
  }

  Future signUp(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      return customUserFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
