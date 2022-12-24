import 'package:flutter/material.dart';

import '../../../constants.dart';

class card extends StatelessWidget {
  const card({
    Key? key,
    required this.cardSize,
    required this.name,
    required this.image,
  }) : super(key: key);

  final double cardSize;
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        // Use the calculated size for the cards
        width: cardSize,
        height: 250,
        child: Column(
          children: [
            Container(
              height: 200,
              width: cardSize,
              color: Constants.primaryColor.withOpacity(.15),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
