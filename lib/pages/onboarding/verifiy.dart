import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_scan/main.dart';
import 'package:halal_scan/widgets/button.dart';

import '../../models/config.dart';
import '../../utility/common_functions.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    print(isVerified);
    if (!isVerified) {
      print('sending verification code');
      sendVerificationEmail();

      timer =
          Timer.periodic(const Duration(seconds: 3), (timer) => checkEmail());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmail() async {
    FirebaseAuth.instance.currentUser!.reload();
    print('checking');
    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      print(isVerified);
    });
    if (isVerified) {
      timer?.cancel();
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      print('sending verification code');

      await user.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isVerified) {
      return const MainPage();
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            const SizedBox(width: 20),
            Text(
              'SCANHALAL',
              style: GoogleFonts.quicksand(
                color: CustomColor.darkBackColor,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Verify your \nemail',
              style: titleLarge().copyWith(fontSize: 40, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/verify.png',
                height: 250,
              ),
            ),
            const SizedBox(height: 20),
            Text(
                'To complete your profile and start exploring halal food with SCANHALAL, you\'ll need to verify your email address.',
                style: bodyMedium()),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 25),
        child: CustomElevatedButton(
          height: 55,
          text: 'Resend email',
          onTap: sendVerificationEmail,
        ),
      ),
    );
  }
}
