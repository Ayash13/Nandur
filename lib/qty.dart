import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/widgets/plant_widget.dart';
import 'constants.dart';
import 'package:flutter_onboarding/models/plants.dart';

class Qty extends StatefulWidget {
  const Qty({super.key});

  @override
  State<Qty> createState() => _QtyState();
}

class _QtyState extends State<Qty> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (index > 0) {
                  index--;
                }
              });
            },
            icon: Icon(Icons.remove),
          ),
          Text(
            index.toString(),
            style: TextStyle(
              color: Constants.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                index++;
              });
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
