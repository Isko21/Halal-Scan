import 'package:flutter/material.dart';
import 'package:halal_scan/main.dart';
import 'package:halal_scan/models/user.dart';
import 'package:provider/provider.dart';

import '../pages/onboarding/signup.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CustomUser?>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: currentUser == null ? const SignUpPage() : const MainPage(),
    );
  }
}
