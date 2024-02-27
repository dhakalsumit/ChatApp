// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:chatapp/Pages/complete_profile.dart';
import 'package:chatapp/Pages/log_in.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:chatapp/services/usermodel.dart';

class RegisterPage extends StatefulWidget {
  final Usermodel;

  const RegisterPage({
    Key? key,
    this.Usermodel,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  // var newuser;
  // var credential;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
          .set(newuser.toMap())
          .then((value) => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CompleteProfile(
                        userModel: newuser,
                        firebaseuser: credential!.user!,
                      ))));
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'ConnectUs',
                style: TextStyle(
                    color: Color.fromARGB(221, 36, 21, 21),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              const Text("Create your account now and explore",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
              const SizedBox(
                height: 20,
              ),
              const Image(image: AssetImage("images/connectus.png")),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(top: 30),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: "Email",
                            prefixIcon: Icon(
                              Icons.email,
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(top: 30),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: "Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            // If the button is pressed, return green, otherwise blue
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.blueGrey;
                            }
                            return Colors.blue;
                          }),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            signup(_emailController.text,
                                _passwordController.text);
                          }
                        },
                        child: const Center(
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: "Already have an account ?",
                    ),
                    TextSpan(
                        text: ' Login Here',
                        style: const TextStyle(
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogIn()));
                          }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
