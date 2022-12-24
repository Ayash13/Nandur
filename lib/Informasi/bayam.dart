import 'package:flutter/material.dart';
import 'package:flutter_onboarding/Informasi/model.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/screens/widgets/card.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class bayam extends StatelessWidget {
  const bayam({
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
                        'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/11/23/3738024711.jpg',
                        'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2021/10/15060945/manfaat-bayam-merah-yang-jarang-diketahui-halodoc.jpg',
                        'https://cdn.idntimes.com/content-images/post/20190702/chinesespinach2-087d3560e1f28f906a3cd8a744a546d2_600x400.jpg',
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
                                      '20-25 Hari',
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
                                      '20-40 cm',
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
                              "Bayam membutuhkan cukup banyak air, sehingga baik ditanam pada awal musim hujan, Oktober - November. Bayam dapat tumbuh sepanjang tahun dengan ketinggian 5 – 2.000 m dpl, kelembapan 40 – 60%, bertekstur tanah gembur dan tanah ber-pH 6 – 7. Tanah yang dibutuhkan bayam adalah 160 kg/bak yang berisi 25 tanaman, bak tersebut merupakan bak kayu berukuran 1 m x 1 m dengan tinggi 35 cm, sehingga luas permukaan tanah yang akan ditempati oleh tanaman adalah 1m2",
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
