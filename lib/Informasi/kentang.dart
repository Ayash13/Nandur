import 'package:flutter/material.dart';
import 'package:flutter_onboarding/Informasi/model.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/screens/widgets/card.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class kentang extends StatelessWidget {
  const kentang({
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
                        'https://asset.kompas.com/crops/kOvZjo-YwninNCMJ6CtXGXcWr_U=/0x0:1000x667/750x500/data/photo/2022/09/15/6322f995cdcfd.jpg',
                        'https://cdn1-production-images-kly.akamaized.net/A5G4rDZhD2-MkKmv5QF_I8H3Da0=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2733644/original/082057800_1550655999-foto_kentang.jpg',
                        'https://www.dictio.id/uploads/db3342/original/3X/e/4/e42a2316d99a0e57fc4d88dfe6f4c7897e5062ad.jpeg'
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
                                      '3-4 bulan',
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
                                      '40-50 cm',
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
                              "Kentang dikenali orang sebagai makanan pokok di luar negeri. Ini karena kentang mengandung karbohidrat. Di Indonesia sendiri, kentang masih dianggap sebagai sayuran yang mewah. Namun demikian, kentang adalah makanan yang enak serta sangat bernutrisi.[2] Juga dikenali mengandung sejumlah vitamin dari A, B-kompleks, hingga C, hingga asam folat. Juga mineral, protein, karbohidrat, karotenoid, dan polifenol. Dalam tubuh kentang ini, juga ada zat solanin yang dikenal sebagai obat penenang, antikejang, antijamur, dan pestisidal.[3] Vitamin C yang terkandung dalam kentang setiap 100 g adalah 17 mg. Selain terkandung karbohidrat dan serat-serat, mineral yang ada padanya antara lain adalah zat besi, fosfor, dan kalium.[4] Kompresan air kentang ini dikenal sangat membantu pengobatan luka pada kulit, terlebih di negara miskin yang sulit cangkok kulit.",
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
