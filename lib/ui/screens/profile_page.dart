import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/profile_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_onboarding/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_onboarding/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;

  get dropdownValue => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //create circle avatar if user has photo
            if (FirebaseAuth.instance.currentUser?.photoURL != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser?.photoURL ?? ""),
              ),
            //else create circle avatar
            if (FirebaseAuth.instance.currentUser?.photoURL == null)
              CircleAvatar(
                radius: 50,
                backgroundImage: const AssetImage("assets/images/Nandur.png"),
              ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              //when user click on text, then show dialog to change name
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Ganti Username"),
                      content: TextField(
                        onChanged: (value) {
                          setState(() {
                            FirebaseAuth.instance.currentUser
                                ?.updateDisplayName(value);
                          });
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Batal",
                              style: TextStyle(color: Colors.black)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Ok",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                FirebaseAuth.instance.currentUser?.displayName ??
                    "*Ganti Username",
                style: TextStyle(
                  color: Constants.blackColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              FirebaseAuth.instance.currentUser?.email ?? "",
              style: TextStyle(
                color: Constants.blackColor.withOpacity(.3),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 2,
                    color: Colors.white,
                    child: Center(
                      child: Image.asset(
                        "assets/images/promo.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //when user click on button, then show dialog
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) => Get.offAll(
                        () => SignIn(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 500)));
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: const Center(
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
