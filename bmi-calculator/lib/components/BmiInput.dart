import 'package:bmi_calculator/components/UIRoundedButton.dart';
import 'package:bmi_calculator/components/UiCard.dart';
import 'package:bmi_calculator/components/UiCardButton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiInputView extends StatefulWidget {
  @override
  _BmiInputViewState createState() => _BmiInputViewState();
}

class _BmiInputViewState extends State<BmiInputView> {
  String genderSelected = '';
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: UiCardButton(
                        icon: FontAwesomeIcons.mars,
                        isActive: genderSelected == 'male',
                        label: 'MALE',
                        onTap: () {
                          setState(() {
                            genderSelected = 'male';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: UiCardButton(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                        isActive: genderSelected == 'female',
                        onTap: () {
                          setState(() {
                            genderSelected = 'female';
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Slider
              Expanded(
                  child: UiCard(
                color: kUICardBgColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kInputValueTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kInputLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 18.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
//                        activeColor: Color(0xFFEB1555),
                        min: kMinHeight,
                        max: kMaxHeight,
                        value: height.toDouble(),
                        onChanged: (double val) {
                          setState(() {
                            height = val.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )),

              // Bottom Inputs
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: UiCard(
                        color: kUICardBgColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: kInputLabelTextStyle,
                            ),
                            Text(
                              '74',
                              style: kInputValueTextStyle,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 10.0),
                                  child: RoundedIconButton(
                                    icon: FontAwesomeIcons.plus,
                                  ),
                                ),
                                RoundedIconButton(
                                  icon: FontAwesomeIcons.minus,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                          child: UiCard(
                        color: kUICardBgColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: kInputLabelTextStyle,
                            ),
                            Text(
                              '19',
                              style: kInputValueTextStyle,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 10.0),
                                  child: RoundedIconButton(
                                    icon: FontAwesomeIcons.plus,
                                  ),
                                ),
                                RoundedIconButton(
                                  icon: FontAwesomeIcons.minus,
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xFFEA1456),
                width: double.infinity,
                height: kCalcButtonHeight,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: FlatButton(
                        onPressed: () {},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: Text(
                            'CALCULATE YOUR BMI',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
