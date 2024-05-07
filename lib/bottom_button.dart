import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        child: Text(title, style: TextStyle(fontSize: 22)),
        width: double.infinity,
        height: 80,
        color: Color(0xFFEB1555),
      ),
    );
  }
}
