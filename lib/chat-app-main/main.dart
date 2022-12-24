import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/chat-app-main/chatpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "",
    appId: "",
    messagingSenderId: "",
    projectId: "",
  ));
  var email;
  runApp(ChatApp());
}

class ChatApp extends StatefulWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  final user = FirebaseAuth.instance.currentUser;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String email = "";
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: chatpage(email: user!.email!),
      debugShowCheckedModeBanner: false,
    );
  }
}
