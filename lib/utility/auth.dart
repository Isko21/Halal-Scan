import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halal_scan/models/user.dart';

class AuthService extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  CustomUser? customUserFromFirebase({User? user, CustomUser? customUser}) {
    print(user.toString());
    print(customUser.toString());
    return (user != null && customUser != null)
        ? CustomUser(
            uid: user.uid,
            email: user.email,
            fullName: customUser.fullName,
            password: customUser.password,
            isReviewer: customUser.isReviewer,
            photoUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8sz484NbeS21UH8wlx9yDd0WROQsCMpS-mvXjkmY&s',
            memberSince: Timestamp.fromDate(DateTime.now()),
          )
        : null;
  }

  Stream<CustomUser?> get authUser {
    return firebaseAuth
        .authStateChanges()
        .map((event) => customUserFromFirebase(user: event));
  }

  Future signUp(String email, String password, CustomUser customUser) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      return customUserFromFirebase(user: user, customUser: customUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = credential.user;
      return customUserFromFirebase(user: user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return e.code;
      } else if (e.code == 'wrong-password') {
        return e.code;
      }
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
