import 'package:flutter/material.dart';
import 'package:flutter_onboarding/Informasi/model.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/screens/widgets/card.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class kangkung extends StatelessWidget {
  const kangkung({
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
                        'https://asset.kompas.com/crops/sqhglH26AgQ_1Ay729WVOFfqzhI=/100x0:945x563/750x500/data/photo/2020/07/02/5efccd6a31d12.jpg',
                        'https://cdn.idntimes.com/content-images/community/2019/10/untitled-d3d9f78b25268a2505216e16ffc16d73.jpg',
                        'https://asset.kompas.com/crops/gVLZ9HBSRYRjBrq2BR51RF7dorA=/10x0:978x645/780x390/data/photo/2021/05/30/60b334dced1dc.jpg',
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
                                      '30-45 Hari',
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
                                      '20-30 cm',
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
                              "Kangkung dapat memberikan hasil yang optimum pada kondisi dataran rendah Tropika dengan temperatur tinggi dan penyinaran yang pendek. Temperatur yang ideal berkisar 25 – 30oC, sedangkan dibawah 10 oC tanaman akan rusak. Kangkung dapat hidup pada kesuburan tanah sedang. Kangkung membutuhkan banyak air karena berbatang basah. Pengairan sangat diperlukan setelah tanam, terutama bila tanaman layu pada siang hari. Pengairan dapat dilakukan dengan dileb diantara bedengan.",
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
