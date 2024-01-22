import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0E21)),
        // primaryColor: Colors.red, //  Color(0xFF0A0E21)
        // textTheme: TextTheme(
        //   displayMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        // ),
      ),
    );
  }
}