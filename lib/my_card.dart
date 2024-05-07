import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  Widget cardChild;
  Color color;
  final Function()? onTapFunc;

  MyCard(
      {super.key, required this.cardChild, required this.color, required this.onTapFunc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunc,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: cardChild,
      ),
    );
  }
}
