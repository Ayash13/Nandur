import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_onboarding/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:get/get.dart';

class Bayayar extends StatefulWidget {
  const Bayayar({super.key});

  @override
  State<Bayayar> createState() => _BayayarState();
}

class _BayayarState extends State<Bayayar> {
  PlatformFile? pickedFile;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  UploadTask? uploadTask;
  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });
    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
    setState(() {
      pickedFile = null;
      uploadTask = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text("Upload Bukti Pembayaran"),
        ),
        actions: const [],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (pickedFile != null)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    child: Center(
                      child: Image.file(
                        File(
                          pickedFile!.path.toString(),
                        ),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      selectFile();
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Pilih File',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      uploadFile();
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Upload File',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildProgress(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  if (Get.offAll(RootPage()) == true) {
                  } else {
                    Get.snackbar(
                      "Berhasil",
                      "Terimakasih Sudah Melakukan Pembayaran",
                      backgroundColor: Color.fromARGB(149, 76, 175, 79),
                      colorText: Colors.white,
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Selesai',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProgress() {
    return StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;
          return SizedBox(
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Color.fromARGB(182, 76, 175, 79),
                  color: Constants.primaryColor,
                ),
                Center(
                  child: Text(
                    '${(progress * 100).toStringAsFixed(2)} %',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox(
            height: 50,
            child: Center(
              child: Text(
                'Pilih Bukti Pembayaran, Lalu Klik Upload',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
