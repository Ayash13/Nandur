import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:flutter_onboarding/ui/screens/forgot_password.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';
import 'package:flutter_onboarding/ui/screens/signup_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_onboarding/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_onboarding/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    //'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class GSignIn extends StatefulWidget {
  const GSignIn({super.key});

  @override
  State<GSignIn> createState() => _GSignInState();
}

class _GSignInState extends State<GSignIn> {
  GoogleSignInAccount? _currentUser;

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
