import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  void showPhotoOption() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Complete Profile"),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            CupertinoButton(
              onPressed: () {
                showPhotoOption();
              },
              child: CircleAvatar(
                radius: 60,
                child: Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  contentPadding: EdgeInsets.only(left: 30),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Submit"))
          ],
        ));
  }
}
