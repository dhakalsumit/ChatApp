import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future registerwithEmailandPassword(
       String email, String password) async {
    try {
      User user =(await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password)).user!;
          
    } on FirebaseAuthException {
     
      print("e");
    }
  }

  Future loginwithEmailAndPassword ( String email, String password )async{
try {
  User user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)) as User;
}
catch (e){}
  }
}
