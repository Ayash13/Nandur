import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImg extends StatefulWidget {
  CarouselImg({super.key, required this.imgList});
  List<String> imgList = [];

  @override
  State<CarouselImg> createState() => _CarouselImgState();
}

class _CarouselImgState extends State<CarouselImg> {
  @override
  Widget build(BuildContext context) {
    List<String> list = widget.imgList;
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.5,
          enlargeCenterPage: true,
        ),
        items: widget.imgList.map(
          (item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.network(item, fit: BoxFit.cover),
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
