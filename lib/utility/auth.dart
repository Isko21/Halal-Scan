import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
  Future signIn() async {
    try {
      await _auth.signInWithProvider(_googleAuthProvider);
    } catch (e) {
      print(e);
    }
  }
}
