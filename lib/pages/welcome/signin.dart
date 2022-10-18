import 'package:flutter/material.dart';
import 'package:halal_scan/utility/auth.dart';

class AuthenticatePage extends StatefulWidget {
  const AuthenticatePage({super.key});

  @override
  State<AuthenticatePage> createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {
  final _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        const Text('auth'),
        ElevatedButton(
            onPressed: () => _authService.signIn(),
            child: const Text('Sign In'))
      ],
    )));
  }
}
