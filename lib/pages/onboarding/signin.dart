import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_scan/pages/onboarding/create_user.dart';
import 'package:halal_scan/utility/auth.dart';
import 'package:halal_scan/utility/common_functions.dart';
import 'package:halal_scan/widgets/button.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../models/config.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authService = AuthService();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  String error = "";
  @override
  Widget build(BuildContext context) {
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
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome \nback!',
                  style:
                      titleLarge().copyWith(fontSize: 40, color: Colors.black),
                ),
                const SizedBox(height: 20),
                Text('Email address',
                    style: bodyMedium().copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                TextFormField(
                  validator: validateEmail,
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {
                      error = "";
                    });
                  },
                  decoration: InputDecoration(
                    fillColor: CustomColor.veryLightBackColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: CustomColor.darkBackColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text('Password',
                    style: bodyMedium().copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                TextFormField(
                  validator: validatePassword,
                  onChanged: (value) {
                    setState(() {
                      error = "";
                    });
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    fillColor: CustomColor.veryLightBackColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: CustomColor.darkBackColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Visibility(
                          visible: error.isNotEmpty,
                          child: Text(
                            error,
                            style: bodyMedium().copyWith(color: Colors.red),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: error.isEmpty ? 35 : 20),
                CustomElevatedButton(
                  text: 'Sign In',
                  height: 55,
                  onTap: () async {
                    if (key.currentState!.validate()) {
                      dynamic result = await authService.signIn(
                          emailController.text.trim(),
                          passwordController.text.trim());
                      print(result);
                      if (result == 'user-not-found') {
                        error = 'Wrong email or user not found.';
                      } else if (result == 'wrong-password') {
                        error = 'Wrong password. Please try again';
                      }
                    }
                    setState(() {});
                  },
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: RoundCheckBox(
                            isChecked: true,
                            borderColor: CustomColor.buttonColor,
                            checkedColor: CustomColor.buttonColor,
                            onTap: (selected) {},
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Remember me',
                          style: bodyMedium().copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: bodyMedium(),
                        ))
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do not have an account?',
                      style: bodyMedium(),
                    ),
                    TextButton(
                      onPressed: () {
                        print(isSignIn);
                        isSignIn = !isSignIn;
                        print(isSignIn);
                        setState(() {});
                      },
                      child: Text(
                        'Sign Up',
                        style: bodyMedium(),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
