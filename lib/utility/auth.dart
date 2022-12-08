import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  late GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  CustomUser? userConverter(GoogleSignInAccount? googleUser) {
    return googleUser != null
        ? CustomUser(
            uid: googleUser.id,
            fullName: googleUser.displayName!,
            photoUrl: googleUser.photoUrl!,
            isReviewer: false,
            memberSince: Timestamp.now(),
          )
        : null;
  }

  Future<void> googleLogIn() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }
      _user = googleUser;

      final GoogleSignInAuthentication googlAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googlAuth.accessToken,
        idToken: googlAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception {
      rethrow;
    }
    userConverter(_user);
    notifyListeners();
  }

  Future<void> logOut() async {
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }
}

class AnonymousSignInProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signIn() async {
    try {
      final UserCredential result = await auth.signInAnonymously();
      final User user = result.user!;
      return user;
    } on Exception {
      rethrow;
    }
  }

  @override
  void notifyListeners();
}
