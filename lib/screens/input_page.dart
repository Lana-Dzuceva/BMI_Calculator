import 'dart:math';

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import '../bottom_button.dart';
import '../constants.dart';
import '../icon_content.dart';
import '../my_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../enums.dart';
import '../round_icon_button.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender curGender = Gender.male;
  Color maleCardColor = kActiveCardColor;
  Color femaleCardColor = kActiveCardColor;
  int height = 180;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyCard(
                      onTapFunc: () {
                        setState(() {
                          curGender = Gender.male;
                        });
                      },
                      color: curGender == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                    )),
                Expanded(
                    child: MyCard(
                      onTapFunc: () {
                        setState(() {
                          curGender = Gender.female;
                        });
                      },
                      color: curGender == Gender.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            child: MyCard(
              onTapFunc: () {},
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: kLabelTextStyle),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: height.toString(), style: kNumberTextStyle),
                      TextSpan(
                        text: "cm",
                        style: kLabelTextStyle,
                      )
                    ]),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF9D9E98),
                      activeTrackColor: Colors.white,
                      thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 12),
                      overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 22),
                      overlayColor: const Color(0x29BB1555),
                      thumbColor: const Color(0xFFBB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double number) {
                        setState(() {
                          height = number.toInt();
                        });
                      },
                      min: 120,
                      max: 220,
                      // activeColor: Color(0xFFBB1555),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyCard(
                        onTapFunc: () {
                          setState(() {
                            curGender = Gender.male;
                          });
                        },
                        color: curGender == Gender.male
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("WEIGHT", style: kLabelTextStyle),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  iconData: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight = max(weight - 1, 10);
                                    });
                                  },
                                ),
                                const SizedBox(width: 10),
                                RoundIconButton(
                                  iconData: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ))),
                Expanded(
                    child: MyCard(
                        onTapFunc: () {
                          setState(() {
                            curGender = Gender.male;
                          });
                        },
                        color: curGender == Gender.male
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("AGE", style: kLabelTextStyle),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  iconData: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age = max(age - 1, 0);
                                    });
                                  },
                                ),
                                const SizedBox(width: 10),
                                RoundIconButton(
                                  iconData: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ))),
              ],
            ),
          ),
          BottomButton(
              title: "CALCULATE",
              onPressed: () {
                CalculatorBrain brain = CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmi: brain.calculateBMI(),
                        resultText: brain.getResult(),
                        interpretation: brain.getInterpretation(),
                      ),
                    ));

              }
          ),
        ],
      ),
    );
  }
}
