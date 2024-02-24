import 'package:chatapp/services/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticator {
  signup(String email, String password) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      print("error is $error");
    }

    if (credential != null) {
      String uid = credential.user!.uid;
      Usermodel newuser = Usermodel(
        uid: uid,
        email: email,
        fullname: "",
        profilepic: "",
      );
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set(newuser.toMap());
    }
  }

  login(String email, String password) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      print("error is $error");
    }

    if (credential != null) {
      String uid = credential.user!.uid;

      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();

      Usermodel usermodel =
          Usermodel.fromMap(userData.data() as Map<String, dynamic>);
    }
  }
}
