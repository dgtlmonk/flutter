import 'package:bmi_calculator/components/UiCard.dart';
import 'package:bmi_calculator/components/UiCardButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double calcButtonHeight = 80;
const uiCardBgColor = Color(0xFF1C1E33);
const uiGenderBgColor = Color(0xFF1C1E33);

class BmiInputView extends StatefulWidget {
  @override
  _BmiInputViewState createState() => _BmiInputViewState();
}

class _BmiInputViewState extends State<BmiInputView> {
  String genderSelected = '';

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
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            genderSelected = 'male';
                          });
                        },
                        child: UiCardButton(
                          icon: FontAwesomeIcons.mars,
                          isActive: genderSelected == 'male',
                          label: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            genderSelected = 'female';
                          });
                        },
                        child: UiCardButton(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                          isActive: genderSelected == 'female',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: UiCard(
                        color: uiCardBgColor,
                      ),
                    ),
                  ],
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
