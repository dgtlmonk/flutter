import 'package:bmi_calculator/components/UICard.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BmiResultView extends StatelessWidget {
  BmiResultView(
      {@required this.bmi, @required this.status, @required this.statusText});

  final String bmi;
  final String status;
  final String statusText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Container(
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 35,
                ),
              ),
            ),

            // Result
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: UiCard(
                            color: kUICardBgColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  status,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: Color(0xFF23BC6C),
                                  ),
                                ),
                                Text(
                                  bmi,
                                  style: TextStyle(
                                    fontSize: 90.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text('Normal BMI range:'),
                                Text('18,5 - 25 kg/m2'),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    statusText,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF23BC6C),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            // Reset
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
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        child: Text(
                          'RE-CALCULATE YOUR BMI',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
