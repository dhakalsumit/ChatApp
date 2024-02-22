import 'package:firebase_auth/firebase_auth.dart';

class Authenticator {
  signup(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("user is $userCredential");
    } catch (error) {
      print("error is $error");
    }
  }

  login(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("user is login  $userCredential");
    } catch (error) {
      print("error is $error");
    }
  }
}