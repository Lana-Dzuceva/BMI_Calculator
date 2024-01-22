import 'package:flutter/material.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'my_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'enums.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender curGender = Gender.male;
  Color maleCardColor = kActiveCardColor;
  Color femaleCardColor = kActiveCardColor;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
          child: Column(
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
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 22),
                      overlayColor:  Color(0x29BB1555),
                      thumbColor: Color(0xFFBB1555),
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
          // Expanded(
          //   child: Row(
          //     children: [
          //       Expanded(
          //           child: MyCard(
          //             onTapFunc: () {
          //               setState(() {
          //                 curGender = Gender.male;
          //               });
          //             },
          //             color: curGender == Gender.male
          //                 ? kActiveCardColor
          //                 : kInActiveCardColor,
          //             cardChild: IconContent(
          //               icon: FontAwesomeIcons.mars,
          //               label: "MALE",
          //             ),
          //           )),
          //       Expanded(
          //           child: MyCard(
          //             onTapFunc: () {
          //               setState(() {
          //                 curGender = Gender.female;
          //               });
          //             },
          //             color: curGender == Gender.female
          //                 ? kActiveCardColor
          //                 : kInActiveCardColor,
          //             cardChild: Text("qqq"),
          //           )),
          //     ],
          //   ),
          // ),

          Container(
            // child: Text("qqq"),
            width: double.infinity,
            height: 80,
            color: Color(0xFFEB1555),
          )
        ],
      )),
      // floatingActionButton: Theme(
      //   data: ThemeData(
      //     primarySwatch: Colors.red,
      //   ),
      //   child: FloatingActionButton(
      //     backgroundColor: Colors.green,
      //     foregroundColor: Colors.black,
      //     onPressed: () {},
      //     child: Icon(Icons.add),
      //   ),
      // ),
    );
  }
}
