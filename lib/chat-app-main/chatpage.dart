import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import 'message.dart';

class chatpage extends StatefulWidget {
  String email;
  chatpage({required this.email});
  @override
  _chatpageState createState() => _chatpageState(email: email);
}

class _chatpageState extends State<chatpage> {
  String email;
  _chatpageState({required this.email});

  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.offAll(() => RootPage(), transition: Transition.upToDown);
              },
              icon: Icon(
                Icons.close,
                color: Constants.primaryColor,
              ),
            ),
            Center(
              child: Text(
                'Ruang Komunitas',
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 40,
            )
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: messages(email: email),
        color: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Constants.primaryColor.withOpacity(0.2),
                ),
                child: TextField(
                  controller: message,
                  decoration: InputDecoration(
                    hintText: 'Tulis Pesan...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20, top: 2),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Constants.primaryColor,
              ),
              child: IconButton(
                onPressed: () {
                  fs.collection('Messages').add({
                    'email': _auth.currentUser!.email,
                    'message': message.text,
                    'time': DateTime.now(),
                  });
                  message.clear();
                },
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
