import 'package:flutter/material.dart';

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
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      itemCount: 3,
      itemBuilder: (context, i) {
        switch (i) {
          case 0:
            return CreateUserView(onNextClicked: () => nextPage());

          case 1:
            return ChooseRoleView(onNextClicked: () => nextPage());

          case 2:
            return HalalInfoView(onNextClicked: () => nextPage());
        }
        return ChooseRoleView(
          onNextClicked: () => nextPage(),
        );
      },
    );
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 250), curve: Curves.ease);
  }
}
