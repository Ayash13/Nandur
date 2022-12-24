// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_onboarding/Informasi/bawang.dart';
import 'package:flutter_onboarding/Informasi/bayam.dart';
import 'package:flutter_onboarding/Informasi/bunga_kol.dart';
import 'package:flutter_onboarding/Informasi/kangkung.dart';
import 'package:flutter_onboarding/Informasi/selada.dart';
import 'package:flutter_onboarding/Informasi/tomat.dart';
import 'padi.dart';
import 'kentang.dart';

class information extends StatefulWidget {
  const information({Key? key}) : super(key: key);

  @override
  State<information> createState() => _informationState();
}

class _informationState extends State<information> {
  get contsize => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Center(
            child: Text("Informasi"),
          ),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              padi(
                image: "assets/images/padi.png",
                nama: "Padi ",
                latin: "(Oryza sativa)",
              ),
              SizedBox(
                height: 10,
              ),
              kentang(
                image: "assets/images/kentang.png",
                nama: "Kentang ",
                latin: "(Solanum tuberosum)",
              ),
              SizedBox(
                height: 10,
              ),
              bawang(
                image: "assets/images/bawang.png",
                nama: "Bawang ",
                latin: "(Allium)",
              ),
              SizedBox(
                height: 10,
              ),
              tomat(
                image: 'assets/images/tomat.png',
                nama: 'Tomat ',
                latin: '(Solanum lycopersicum)',
              ),
              SizedBox(
                height: 10,
              ),
              selada(
                image: 'assets/images/selada.png',
                nama: 'Selada ',
                latin: '(Lactuca sativa)',
              ),
              SizedBox(
                height: 10,
              ),
              bayam(
                image: 'assets/images/bayam.png',
                nama: 'Bayam Merah ',
                latin: '(Amaranthus t)',
              ),
              SizedBox(
                height: 10,
              ),
              kangkung(
                image: 'assets/images/kangkung.png',
                nama: 'Kangkung ',
                latin: '(Ipomoea aquatica)',
              ),
              SizedBox(
                height: 10,
              ),
              bunga_kol(
                image: 'assets/images/kol.png',
                nama: 'Bunga Kol ',
                latin: '(Brassica oleraceae)',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
