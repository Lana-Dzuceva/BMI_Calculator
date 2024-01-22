import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  Widget cardChild;
  Color color;
  final Function()? onTapFunc;

   MyCard({required this.cardChild, required this.color, required this.onTapFunc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunc,
      child: Container(
        margin: const EdgeInsets.all(15),
        // height: 200,
        // width: double.infinity,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10)),
        child: cardChild,
      ),
    );
  }
}
