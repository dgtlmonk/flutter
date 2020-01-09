import 'package:flutter/material.dart';

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
              Container(
                child: Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          child: Row(
                        children: <Widget>[
                          Container(
                            child: Expanded(
                              child: Container(
                                height: 150,
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                                decoration: BoxDecoration(
                                  color: Color(0xFF1C1E33),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text('Female'),
                              ),
                            ),
                          ),
                          Container(
                            child: Expanded(
                              child: Container(
                                height: 150,
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                                decoration: BoxDecoration(
                                  color: Color(0xFF1C1E33),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text('Male'),
                              ),
                            ),
                          ),
                        ],
                      )),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        decoration: BoxDecoration(
                          color: Color(0xFF1C1E33),
                        ),
                        child: Row(
                          children: <Widget>[Text('hey')],
                        ),
                      ),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Container(
                            child: Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                                decoration: BoxDecoration(
                                  color: Color(0xFF1C1E33),
                                ),
                                child: Text('hey'),
                              ),
                            ),
                          ),
                          Container(
                            child: Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                                decoration: BoxDecoration(
                                  color: Color(0xFF1C1E33),
                                ),
                                child: Text('hey'),
                              ),
                            ),
                          ),
                        ],
                      )),

                      // Calculate Button
                    ],
                  ),
                ),
              ),
              Container(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: Color(0xFFEA1456),
                          child: Container(
                            child: FlatButton(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                child: Text(
                                  'CALCULATE YOUR BMI',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ));
  }
}
