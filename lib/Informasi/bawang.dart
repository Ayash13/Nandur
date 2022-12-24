import 'package:flutter/material.dart';
import 'package:flutter_onboarding/Informasi/model.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/screens/widgets/card.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class bawang extends StatelessWidget {
  const bawang({
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
                        'https://cdn-cas.orami.co.id/parenting/images/Tips_Saat_Memanen_Tanaman_Bawang_Putih.width-1000.jpg',
                        'https://blogpictures.99.co/wp-content/uploads/2017/11/Bawang-Putih-3.jpg',
                        'https://bibitbunga.com/wp-content/uploads/2015/10/tunas-bawang-putih.jpg',
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
                                      '60-90 Hari',
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
                                      '30-90 cm',
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
                              "Bawang adalah tanaman yang dikenal dengan daun dan bahan makanan yang tajam yang disebut bawang. Tanaman bawang tumbuh di daerah tropis dan subtropis di seluruh dunia dan sering digunakan dalam masakan di seluruh dunia. Bawang merah dan bawang putih adalah dua jenis bawang yang paling umum digunakan dalam masakan, sementara bawang Bombay adalah varietas yang lebih besar dan lebih tua yang sering digunakan dalam masakan India dan Asia Timur. Tanaman bawang membutuhkan cahaya matahari langsung untuk tumbuh dengan baik dan harus ditanam di tanah yang cukup subur dan diberi air secara teratur. Bawang dapat dipanen setelah tumbuh selama 60-150 hari tergantung pada jenisnya. Bawang memiliki beragam manfaat kesehatan, termasuk mengurangi risiko penyakit jantung, mengurangi tekanan darah tinggi, dan membantu mengurangi gejala menopause.",
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
