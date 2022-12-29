import 'package:flutter/material.dart';
import 'package:halal_scan/main.dart';
import 'package:halal_scan/models/user.dart';
import 'package:halal_scan/pages/onboarding/signup.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CustomUser?>(context);
    return currentUser == null ? const SignUpPage() : const MainPage();
  }
}
