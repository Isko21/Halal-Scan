import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halal_scan/models/user.dart';

class AuthService extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  CustomUser? customUserFromFirebase({User? user}) {
    if (user != null) {
      checkIfDocExists(user.uid).then((value) {
        if (value) {
          final doc =
              FirebaseFirestore.instance.collection('users').doc(user.uid);
          doc.get().then((document) {
            return CustomUser.fromJson(document.data()!);
          });
        }
      });
    }
    return null;
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

      return customUserFromFirebase(user: user);
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

  Future<bool> checkIfDocExists(String docId) async {
    try {
      var collectionRef = FirebaseFirestore.instance.collection('users');

      var doc = await collectionRef.doc(docId).get();
      return doc.exists;
    } catch (e) {
      rethrow;
    }
  }
}
