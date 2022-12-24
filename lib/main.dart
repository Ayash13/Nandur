import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:get/get.dart';
import 'ui/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_onboarding/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_onboarding/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Onboarding Screen',
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RootPage();
          } else {
            return OnboardingScreen();
          }
        },
      ),
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
