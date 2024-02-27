// ignore_for_file: file_names

import 'package:chatapp/Pages/home_page.dart';
import 'package:chatapp/Pages/register_page.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    
    super.dispose();
  }

  values() {
    login(String email, String password) {
      final loginAuth = Authenticator();
      loginAuth.login(email, password);
    }
  }

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
              const Text("Log in now to see what they are talking!",
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
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blue,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Password ",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  values();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                child: const Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: "Don't have an account ?",
                    ),
                    TextSpan(
                        text: ' Register Here',
                        style: const TextStyle(
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         RegisterPage( )));
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
