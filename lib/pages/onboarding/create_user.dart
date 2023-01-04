import 'package:flutter/material.dart';
import 'package:halal_scan/pages/onboarding/signin.dart';
import 'package:halal_scan/utility/auth.dart';

import '../../models/config.dart';
import '../../models/user.dart';
import '../../utility/common_functions.dart';
import '../../utility/stepper.dart';
import '../../widgets/button.dart';

class CreateUserView extends StatefulWidget {
  final Function() onNextClicked;
  CustomUser currentUser;
  CreateUserView(
      {required this.currentUser, required this.onNextClicked, super.key});

  @override
  State<CreateUserView> createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> with ChangeNotifier {
  final authService = AuthService();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final fullName = TextEditingController();
  final emailAddress = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool isVisible = false;
  bool isVisible2 = false;

  bool isPasswordsSame = true;
  @override
  void dispose() {
    fullName.dispose();
    emailAddress.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 30),
          child: Form(
            key: key,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomStepper(
                totalStep: 3,
                completedStep: 1,
                selectedColor: CustomColor.buttonColor,
                backGroundColor: const Color(0xFFE0E0E0),
              ),
              const SizedBox(height: 20),
              Text(
                'Create your \naccount',
                style: titleLarge().copyWith(fontSize: 40, color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text('Full name',
                  style: bodyMedium().copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextFormField(
                validator: validateFullName,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                controller: fullName,
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
              Text('Email address',
                  style: bodyMedium().copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextFormField(
                validator: validateEmail,
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
                controller: emailAddress,
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
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                controller: password,
                obscureText: !isVisible,
                decoration: InputDecoration(
                  errorText:
                      !isPasswordsSame ? 'Passwords do not match.' : null,
                  suffixIcon: IconButton(
                      onPressed: () => setState(() => isVisible = !isVisible),
                      icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off)),
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
              Text('Confirm Password',
                  style: bodyMedium().copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextFormField(
                validator: validatePassword,
                textInputAction: TextInputAction.done,
                controller: confirmPassword,
                obscureText: !isVisible2,
                decoration: InputDecoration(
                  errorText:
                      !isPasswordsSame ? 'Passwords do not match.' : null,
                  suffixIcon: IconButton(
                      onPressed: () => setState(() => isVisible2 = !isVisible2),
                      icon: Icon(isVisible2
                          ? Icons.visibility
                          : Icons.visibility_off)),
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
              const SizedBox(height: 30),
              CustomElevatedButton(
                  text: 'Next',
                  onTap: () async {
                    FocusScope.of(context).unfocus();

                    if (key.currentState!.validate() &&
                        validateBothPasswords(
                            password.text, confirmPassword.text)) {
                      widget.currentUser.fullName = fullName.text.trim();
                      widget.currentUser.email = emailAddress.text.trim();
                      widget.currentUser.password = password.text;
                      widget.onNextClicked();
                      print('wszystko dobra');
                    }
                  },
                  height: 55),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: bodyMedium(),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                      },
                      child: Text('Sign In', style: bodyMedium()))
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

String? validateFullName(String? fullName) {
  if (fullName == null || fullName.isEmpty) {
    return 'Full name is required.';
  }
  return null;
}

String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Email address is required.';
  }
  String pattern = r'\w+@\w+\.\w+';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(email)) {
    return 'Invalid email address format.';
  }
  return null;
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password is required.';
  }
  if (password.length < 8) {
    return 'Password must be at least 8 characters';
  }

  return null;
}

bool validateBothPasswords(String first, String second) {
  return first == second;
}
