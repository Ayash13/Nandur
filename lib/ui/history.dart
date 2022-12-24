// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/roomchat.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:flutter_onboarding/ui/screens/calendar/calendar1.dart';
import 'package:flutter_onboarding/ui/screens/calendar/screens/calendar.dart';
import 'package:flutter_onboarding/ui/screens/detail_page.dart';
import 'package:flutter_onboarding/Informasi/information.dart';
import 'package:flutter_onboarding/ui/screens/news/news.dart';
import 'package:flutter_onboarding/ui/screens/profile_page.dart';
import 'package:flutter_onboarding/ui/screens/weather/weather.dart';
import 'package:flutter_onboarding/ui/screens/widgets/plant_widget.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';

import 'package:flutter/material.dart';

class Hisory extends StatefulWidget {
  const Hisory({Key? key}) : super(key: key);

  @override
  State<Hisory> createState() => _HisoryState();
}

class _HisoryState extends State<Hisory> {
  @override
  Stream<List<Dataril>> readData() => FirebaseFirestore.instance
      .collection('Pembayaran')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Dataril.fromJson(doc.data())).toList());
  Widget buildHistory(Dataril data) => ListTile(
        title: Text(data.nama as String),
        subtitle: Text(data.id as String),
        trailing: Text(data.total as String),
      );

  late DatabaseReference dbRef;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Pembayaran"),
      ),
      body: StreamBuilder<List<Dataril>>(
        stream: readData(),
        builder: (context, AsyncSnapshot<List<Dataril>> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            return ListView(
              children: data!.map(buildHistory).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class Dataril {
  String? id;
  final String? nama;
  final String? noTelp;
  final String? total;

  Dataril({
    this.nama,
    this.id = '',
    this.noTelp,
    this.total,
  });

  Map<String, dynamic> toJson() => {
        'nama': nama,
        'id': id,
        'noTelp': noTelp,
        'total': total,
      };

  static Dataril fromJson(Map<String, dynamic> json) => Dataril(
        nama: json['nama'],
        id: json['id'],
        noTelp: json['noTelp'],
        total: json['total'],
      );
}
