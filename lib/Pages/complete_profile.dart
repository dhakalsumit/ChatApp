import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  TextEditingController textEditingController = TextEditingController();
  late File imageFile;

  selectImage(ImageSource source) async {
    await ImagePicker().pickImage(source: source);
  }

  void cropImage() async {}

  void showPhotoOption() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Upload Profile"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    selectImage(ImageSource.gallery);
                  },
                  leading: const Icon(Icons.photo),
                  title: const Text("Choose From Gallery"),
                ),
                ListTile(
                  onTap: () {
                    selectImage(ImageSource.camera);
                  },
                  leading: const Icon(Icons.camera_alt),
                  title: const Text("Take a Photo"),
                ),
              ],
            ),
          );
        });
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
              child: const CircleAvatar(
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
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Submit"))
          ],
        ));
  }
}
