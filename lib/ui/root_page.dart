import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/checkout.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/history.dart';
import 'package:flutter_onboarding/ui/roomchat.dart';
import 'package:flutter_onboarding/ui/screens/cart_page.dart';
import 'package:flutter_onboarding/ui/screens/favorite_page.dart';
import 'package:flutter_onboarding/ui/screens/home_page.dart';
import 'package:flutter_onboarding/ui/screens/profile_page.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_onboarding/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Plant> favorites = [];
  List<Plant> myCart = [];
  final snapShot =
      FirebaseFirestore.instance.collection('Pembayaran').snapshots();
  int _bottomNavIndex = 0;

  Stream<List<Riwayat>> readPayment() => FirebaseFirestore.instance
      .collection('Pembayaran')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Riwayat.fromJson(doc.data())).toList());

  //List of the pages
  List<Widget> _widgetOptions() {
    return [
      const HomePage(),
      FavoritePage(
        favoritedPlants: favorites,
      ),
      CartPage(
        addedToCartPlants: myCart,
      ),
      const ProfilePage(),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Beranda',
    'Favorit',
    'Keranjang',
    'Profil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
                child: const roomchat(), type: PageTransitionType.bottomToTop),
          );
        },
        child: Icon(
          Icons.message,
        ),
        backgroundColor: Constants.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(
            () {
              _bottomNavIndex = index;
              final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
              final List<Plant> addedToCartPlants = Plant.addedToCartPlants();

              favorites = favoritedPlants;
              myCart = addedToCartPlants.toSet().toList();
            },
          );
        },
      ),
    );
  }

  Widget buildDatas(Riwayat data) => ListTile(
        title: Text(data.nama),
        subtitle: Text(data.notelp),
        trailing: Text(data.total),
      );
}

class Riwayat {
  late String id;
  late final String nama;
  late final String notelp;
  late final String alamat;
  late final String total;

  Riwayat(
      {required this.id,
      required this.nama,
      required this.notelp,
      required this.alamat,
      required this.total});

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'noTelp': notelp,
        'alamat': alamat,
        'total': total,
      };
  static Riwayat fromJson(Map<String, dynamic> json) => Riwayat(
        id: json['id'],
        nama: json['nama'],
        notelp: json['noTelp'],
        alamat: json['alamat'],
        total: json['total'],
      );
}
