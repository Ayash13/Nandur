import 'package:flutter/material.dart';

import '../chat-app-main/main.dart';

class roomchat extends StatefulWidget {
  const roomchat({Key? key}) : super(key: key);

  // Create a user with an ID of UID if you don't use `FirebaseChatCore.instance.users()` stream

  @override
  State<roomchat> createState() => _roomchatState();
}

class _roomchatState extends State<roomchat> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ChatApp(),
    );
  }
}
