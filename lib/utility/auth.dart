import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halal_scan/models/user.dart';

class AuthService extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  CustomUser? customUserFromFirebase(User? user) {
    if (user != null) {
      return CustomUser(email: user.email, uid: user.uid);
    }
    return null;
  }

  Stream<CustomUser?> get authUser {
    print('rebuilded');
    return firebaseAuth.authStateChanges().map(customUserFromFirebase);
  }

  Future signUp(String email, String password, CustomUser customUser) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      customUser.uid = user!.uid;
      customUser.email = user.email;
      customUser.photoUrl = 'https://robohash.org/${user.uid}';
      customUser.memberSince = Timestamp.fromDate(DateTime.now());
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(customUser.toJson())
          .then((value) => print("success"))
          .catchError((error) => print("error: $error"));
      return customUserFromFirebase(user);
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
      notifyListeners();
      return customUserFromFirebase(credential.user);
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

  static Future<bool> checkIfDocExists(String docId) async {
    try {
      var collectionRef = FirebaseFirestore.instance.collection('users');

      var doc = await collectionRef.doc(docId).get();
      return doc.exists;
    } catch (e) {
      rethrow;
    }
  }
}
