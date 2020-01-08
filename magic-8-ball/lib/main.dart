import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: BallPage(),
    ));

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Ask Me Anything'),
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballCnt = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Row(
        children: <Widget>[
          Expanded(
              child: FlatButton(
            highlightColor: Colors.transparent,
            onPressed: () {
              setState(() {
                ballCnt = Random().nextInt(5) + 1;
              });
            },
            child: Image.asset('images/ball$ballCnt.png'),
          ))
        ],
      )),
    );
  }
}
