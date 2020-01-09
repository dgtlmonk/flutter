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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Icon(
                                      Icons.beach_access,
                                      size: 64,
                                    ),
                                    Text(
                                      'FEMALE',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
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
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Icon(
                                      Icons.beach_access,
                                      size: 64,
                                    ),
                                    Text(
                                      'MALE',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Expanded(
                                child: Container(
                                    padding: EdgeInsets.all(30),
                                    child: Column(
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            )
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        decoration: BoxDecoration(
                          color: Color(0xFF1C1E33),
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
