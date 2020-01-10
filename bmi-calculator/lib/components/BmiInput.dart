import 'package:bmi_calculator/components/UiCard.dart';
import 'package:bmi_calculator/components/UiCardButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double calcButtonHeight = 80;
const uiCardBgColor = Color(0xFF1C1E33);
const uiStatsBgColor = Color(0xFF0F1327);
const uiGenderBgColor = Color(0xFF1C1E33);

class BmiInputView extends StatefulWidget {
  @override
  _BmiInputViewState createState() => _BmiInputViewState();
}

class _BmiInputViewState extends State<BmiInputView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: UiCardButton(
                        icon: FontAwesomeIcons.mars,
                        color: uiCardBgColor,
                        label: 'MALE',
                        isActive: true,
                      ),
                    ),
                    Expanded(
                      child: UiCardButton(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                        color: uiCardBgColor,
                        isActive: false,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: uiCardBgColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '183',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 60,
                              ),
                            ),
                            Text(
                              'cm',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Bottom Inputs
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: UiCard(color: uiCardBgColor),
                    ),
                    Container(
                      child: Expanded(
                          child: UiCard(
                        color: uiCardBgColor,
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xFFEA1456),
                width: double.infinity,
                height: calcButtonHeight,
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ));
  }
}
