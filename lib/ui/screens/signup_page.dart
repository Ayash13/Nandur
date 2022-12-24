import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:flutter_onboarding/ui/screens/home_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/custom_textfield.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_onboarding/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp;
  runApp(SignUp());
}

class _SignUpState extends State<SignUp> {
  //create email text controller
  final TextEditingController _emailController = TextEditingController();
  //create password text controller
  final TextEditingController _passwordController = TextEditingController();
  //crrate name text controller
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future SignUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/signup.png'),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextfield(
                obscureText: false,
                hintText: 'Email Kamu',
                icon: Icons.alternate_email,
                //create email save in firebase
                controller: _emailController,
              ),
              CustomTextfield(
                obscureText: true,
                hintText: 'Password Kamu',
                icon: Icons.lock,
                //create password save in firebase
                controller: _passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      )
                      .then(
                        (value) {
                          Get.snackbar(
                            "Berhasil",
                            "Berhasil membuat akun",
                            backgroundColor: Color.fromARGB(131, 76, 175, 79),
                            colorText: Colors.white,
                          );
                        },
                      )
                      .then(
                        (value) => Get.to(
                          SignIn(),
                          transition: Transition.upToDown,
                        ),
                      )
                      .catchError(
                        (error) => Get.snackbar(
                          'Gagal',
                          'Gagal membuat akun',
                          colorText: Colors.white,
                          backgroundColor: Color.fromARGB(148, 175, 76, 76),
                        ),
                      );
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: SignIn(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Sudah Punya Akun? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
