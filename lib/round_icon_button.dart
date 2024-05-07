import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {super.key, required this.iconData, required this.onPressed});

  final IconData iconData;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
      shape: CircleBorder(),
      elevation: 6,
      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

