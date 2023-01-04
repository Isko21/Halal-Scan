import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:halal_scan/main.dart';
import 'package:halal_scan/models/user.dart';
import 'package:halal_scan/pages/onboarding/signup.dart';
import 'package:halal_scan/utility/auth.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CustomUser?>(context);
    if (currentUser != null) {
      print('user is not null');
      AuthService.checkIfDocExists(currentUser.uid!).then((value) {
        print('we have checked if doc exists');
        if (value) {
          print('doc exists is true');
          final doc = FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser.uid);
          doc.get().then((document) {
            print('we are returning a value');
            final data = document.data();
            currentUser.fullName = data!['fullName'];
            currentUser.email = data['email'];
            currentUser.isReviewer = data['isReviewer'];
            currentUser.memberSince = data['memberSince'];
            currentUser.photoUrl = data['photoUrl'];
          });
        }
      });
      return const MainPage();
    }
    return const SignUpPage();
  }
}
