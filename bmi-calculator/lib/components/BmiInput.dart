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
              Expanded(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          decoration: BoxDecoration(
                            color: Color(0xFF1C1E33),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(
                                Icons.beach_access,
                                size: 64,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          decoration: BoxDecoration(
                            color: Color(0xFF1C1E33),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(
                                Icons.beach_access,
                                size: 64,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF1C1E33),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.all(10),
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
              Expanded(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          decoration: BoxDecoration(
                            color: Color(0xFF1C1E33),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(
                                Icons.beach_access,
                                size: 64,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          decoration: BoxDecoration(
                            color: Color(0xFF1C1E33),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(
                                Icons.beach_access,
                                size: 64,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
