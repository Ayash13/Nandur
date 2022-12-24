import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:flutter_onboarding/ui/screens/forgot_password.dart';
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
import 'googleSignIn.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:auth/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(SignIn());
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    //'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
    _googleSignIn.onCurrentUserChanged.listen((event) {
      setState(() {
        _currentUser = event;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>[
        'email',
        //'https://www.googleapis.com/auth/contacts.readonly',
      ],
    ).signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //create email text controller
  final TextEditingController _emailController = TextEditingController();
  //create password text controller
  final TextEditingController _passwordController = TextEditingController();

  Future SignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/signin.png'),
              const Text(
                'Sign In',
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
                controller: _emailController,
              ),
              CustomTextfield(
                obscureText: true,
                hintText: 'Password Kamu',
                icon: Icons.lock,
                controller: _passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  //if emaoil and password correct, turn to rootpage, if false turn to sign in page
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    Get.snackbar(
                      'Error',
                      'Email atau password tidak boleh kosong',
                      backgroundColor: Color.fromARGB(105, 244, 67, 54),
                      colorText: Colors.white,
                    );
                  } else {
                    SignIn().then((value) {
                      //if email and password is correct
                      Get.snackbar(
                        'Berhasil',
                        'Kamu berhasil Login',
                        backgroundColor: Color.fromARGB(131, 76, 175, 79),
                        colorText: Colors.white,
                      );
                      //navigate to root page
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: RootPage(),
                              type: PageTransitionType.bottomToTop));
                    }).catchError((e) {
                      //if email and password is wrong
                      Get.snackbar(
                        'Email atau password salah',
                        'Silahkan coba lagi',
                        backgroundColor: Color.fromARGB(105, 244, 67, 54),
                        colorText: Colors.white,
                      );
                    });
                  }
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
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: ForgotPassword(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Lupa Password? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Reset Password',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('ATAU'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  signInWithGoogle().then((value) {
                    if (value != null) {
                      Get.offAll(RootPage(), transition: Transition.fadeIn);
                    }
                    signInWithGoogle().then(
                      (value) {
                        //if email and password is correct
                        Get.snackbar(
                          'Berhasil',
                          'Kamu Berhasil Login dengan Google',
                          backgroundColor: Color.fromARGB(131, 76, 175, 79),
                          colorText: Colors.white,
                        );
                      },
                    ).catchError(
                      (e) {
                        //if email and password is wrong
                        Get.snackbar(
                          'Gagal',
                          'Silahkan coba lagi',
                          backgroundColor: Color.fromARGB(105, 244, 67, 54),
                          colorText: Colors.white,
                        );
                      },
                    );
                  });
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Constants.primaryColor),
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Image.asset('assets/images/google.png'),
                      ),
                      Text(
                        'Sign In dengan Google',
                        style: TextStyle(
                          color: Constants.blackColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
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
                          child: SignUp(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Belum Punya Akun? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Daftar',
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
