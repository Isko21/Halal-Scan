import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utility/auth.dart';

class AuthenticatePage extends StatefulWidget {
  const AuthenticatePage({super.key});

  @override
  State<AuthenticatePage> createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {
  // final _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign In'),
          onPressed: () => Provider.of<GoogleSignInProvider>(
            context,
            listen: false,
          ).googleLogIn(),
        ),
      ),
    );
  }
}
