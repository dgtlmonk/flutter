import 'package:bmi_calculator/components/BMIResult.dart';
import 'package:bmi_calculator/components/UICard.dart';
import 'package:bmi_calculator/components/UICardStepper.dart';
import 'package:bmi_calculator/components/UIGenderSelectorCard.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BmiInputView extends StatefulWidget {
  @override
  _BmiInputViewState createState() => _BmiInputViewState();
}

class _BmiInputViewState extends State<BmiInputView> {
  Gender genderSelected;
  int userHeightInCm = 180;
  int userWeightInLbs = kMinWeight;
  int userAge = kMinAge;

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
              // Gender Card
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GenderSelectorCard(
                          gender: Gender.male,
                          isActive: genderSelected == Gender.male,
                          onTap: () {
                            setState(() {
                              genderSelected = Gender.male;
                            });
                          }),
                    ),
                    Expanded(
                      child: GenderSelectorCard(
                        isActive: genderSelected == Gender.female,
                        onTap: () {
                          setState(() {
                            genderSelected = Gender.female;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Height Slider
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
                            userHeightInCm.toString(),
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
                          value: userHeightInCm.toDouble(),
                          onChanged: (double val) {
                            setState(() {
                              userHeightInCm = val.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Weight/Age Stepper input
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: UICardStepperInput(
                          label: 'WEIGHT',
                          value: userWeightInLbs,
                          onChange: (Operation op) {
                            if (Operation.increment == op) {
                              setState(() {
                                userWeightInLbs++;
                              });
                            } else {
                              setState(() {
                                userWeightInLbs--;
                              });
                            }
                          }),
                    ),
                    Expanded(
                      child: UICardStepperInput(
                        label: 'AGE',
                        value: userAge,
                        onChange: (Operation op) {
                          if (Operation.increment == op) {
                            setState(() {
                              userAge++;
                            });
                          } else {
                            setState(() {
                              userAge--;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // calculate button
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BMIResult(),
                            ),
                          );
                        },
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
