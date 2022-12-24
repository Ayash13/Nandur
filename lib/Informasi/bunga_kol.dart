import 'package:flutter/material.dart';
import 'package:flutter_onboarding/Informasi/model.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/screens/widgets/card.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class bunga_kol extends StatelessWidget {
  const bunga_kol({
    Key? key,
    required this.image,
    required this.nama,
    required this.latin,
  }) : super(key: key);
  final String image, nama, latin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Column(
                  children: [
                    CarouselImg(
                      imgList: [
                        'https://www.kampustani.com/wp-content/uploads/2018/10/Cara-Menanam-dan-merawat-Bunga-Kol.jpg',
                        'https://www.kampustani.com/wp-content/uploads/2020/06/cara-menanam-bunga-kol-secara-organik.jpg',
                        'https://cdn1-production-images-kly.akamaized.net/nrQTuB2rf-R91VG07jZpVFcedSI=/1312x0:4769x3457/1200x1200/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2889509/original/045281900_1566461290-shutterstock_597472325.jpg',
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  nama,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  latin,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Masa Panen : ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      '45-75 Hari',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Tinggi Rata-rata : ",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      '20 cm',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Bunga kol dikenal sebagai tanaman sayuran daerah yang beriklim dingin (sub tropis), sehingga di Indonesia cocok ditanam di daerah dataran tinggi antara 1000 – 2000 meter dari atas permukaan laut (dpl) yang suhu udaranya dingin dan lembab. Kisaran temperatur optimum untuk pertumbuhan dan produksi sayuran ini antara 15oC – 18oC, dan maksimum 24oC. Tanaman bunga kol cocok ditanam pada tanah lempung berpasir, tetapi toleran terhadap tanah ringan seperti andosol. Namun syarat yang paling penting keadaan tanahnya subur, gembur, kaya akan bahan organik, tidak mudah becek (menggenang), kisaran pH antara 5,5 – 6,5 dan pengairannya cukup",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    latin,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
