import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/my_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.bmi,
      required this.resultText,
      required this.interpretation});

  final String bmi;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text("Your result", style: kTitleTextStyle),
            ),
          ),
          Expanded(
              flex: 5,
              child: MyCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText.toUpperCase(), style: kResultTextStyle),
                    Text(bmi, style: kBMITextStyle),
                    Text(interpretation,
                        style: kBodyTextStyle, textAlign: TextAlign.center),
                  ],
                ),
                onTapFunc: () {},
              )),
          BottomButton(
            title: "Re-CALCULATE",
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
