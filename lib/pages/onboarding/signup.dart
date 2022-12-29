import 'package:flutter/material.dart';
import 'package:halal_scan/models/user.dart';

import 'choose_role.dart';
import 'create_user.dart';
import 'halal_info.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final PageController pageController = PageController();
  CustomUser user = CustomUser();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: 3,
        itemBuilder: (context, i) {
          switch (i) {
            case 0:
              return CreateUserView(
                  currentUser: user, onNextClicked: () => nextPage());

            case 1:
              return ChooseRoleView(
                  currentUser: user, onNextClicked: () => nextPage());

            case 2:
              return HalalInfoView(
                  currentUser: user, onNextClicked: () => nextPage());
          }
          return ChooseRoleView(
              currentUser: user, onNextClicked: () => nextPage());
        },
      ),
    );
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 250), curve: Curves.ease);
  }
}
