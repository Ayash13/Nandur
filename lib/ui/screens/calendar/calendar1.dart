// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class calendar extends StatefulWidget {
  const calendar({Key? key}) : super(key: key);

  @override
  State<calendar> createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: const Text("Kalender Tanam"),
          ),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
