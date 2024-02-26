import 'dart:io';

import 'package:chatapp/services/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfile extends StatefulWidget {
  final User? firebaseuser;
  final Usermodel? usermodel;
  const CompleteProfile({super.key, this.firebaseuser, this.usermodel});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  TextEditingController textEditingController = TextEditingController();
  File? imageFile;

  void selectImage(ImageSource source) async {
    XFile? pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      // imageFile =  Image.file(File(pickedImage.path));
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  void checkValue() {
    String fullname = textEditingController.text.trim();
    if (fullname == "" || imageFile == null) {
      print("Please fill data");
    } else {
      uploadData();
    }
  }

  void uploadData() async {
    


  }

  void showPhotoOption() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Upload Profile"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    selectImage(ImageSource.gallery);
                  },
                  leading: const Icon(Icons.photo),
                  title: const Text("Choose From Gallery"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
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
              child: CircleAvatar(
                backgroundImage: FileImage(imageFile ?? File("path")),
                radius: 60,
                child: (imageFile == null)
                    ? const Icon(
                        Icons.person,
                        size: 60,
                      )
                    : null,
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
