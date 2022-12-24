import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_onboarding/Informasi/model.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/plant_widget.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_onboarding/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'bayar.dart';

//cretae payment page with total price
class PaymentPage extends StatefulWidget {
  final int totalPrice;
  final List<Plant> addedToCartPlants;
  const PaymentPage(
      {Key? key, required this.totalPrice, required this.addedToCartPlants})
      : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

//cretae payment page with total price
class _PaymentPageState extends State<PaymentPage> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  final _formKey = GlobalKey<FormState>();

  // Create a text controller for each of the form fields
  final TextEditingController namaController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  late DatabaseReference dbRef;

  Future bayar({
    required String nama,
    required String telp,
    required String alamat,
    required String total,
  }) async {
    final isBayar = FirebaseFirestore.instance
        .collection('Pembayaran')
        .doc(FirebaseAuth.instance.currentUser!.email!);
    final json = {
      'nama': namaController.text,
      'noTelp': telpController.text,
      'alamat': alamatController.text,
      'total': widget.totalPrice,
      'id': isBayar.id,
    };
    await isBayar.set(json);
  }

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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Center(
            child: const Text('Pembayaran'),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //create carousel image
              CarouselImg(
                imgList: [
                  'https://cdnwpseller.gramedia.net/wp-content/uploads/2022/08/24092212/webimage-9E50AE6E-1F45-41E9-A1C20E440B35F860.jpg',
                  'https://gadgetren.com/wp-content/uploads/2020/08/ShopeePay-Logo.jpg',
                  'https://career.amikom.ac.id/images/company/cover/1637497527.jpeg',
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '*Transfer ke salah satu nomor rekening diatas',
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              //create total price
              StreamBuilder<String>(
                stream: Stream.value(totalController.text),
                builder: (context, snapshot) {
                  final databaseReference =
                      FirebaseDatabase.instance.ref().child('Pembayaran');

                  databaseReference.set(
                    {widget.totalPrice: totalController.text},
                  );

                  return Text(
                    'Total Harga: \Rp ${widget.totalPrice}',
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              //create payment method and shipping form
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Penerima',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Masukan nama penerima';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: telpController,
                decoration: const InputDecoration(
                  labelText: 'No. Telp Penerima',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Masukan No Telp Penerima';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: alamatController,
                decoration: const InputDecoration(
                  labelText: 'Alamat Pengiriman',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Masukan Alamat Pengiriman';
                  }
                  return null;
                },
              ),
              //create 2 row button
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: GestureDetector(
                  onTap: () {
                    bayar(
                      nama: namaController.text,
                      telp: telpController.text,
                      alamat: alamatController.text,
                      total: widget.totalPrice.toString(),
                    ).then(
                      (value) => Get.off(
                        Bayayar(),
                        transition: Transition.zoom,
                      ),
                    );
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
                        'Bayar',
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
      ),
    );
  }
}
