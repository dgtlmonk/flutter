import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

void main() => runApp(MyApp());

double kCircleBG_width = 250;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Steps tracker mini app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: StepsDisplay(),
      ),
    );
  }
}

class StepsDisplay extends StatefulWidget {
  @override
  _StepsDisplayState createState() => _StepsDisplayState();
}

class _StepsDisplayState extends State<StepsDisplay> {
  Pedometer _pedometer;
  StreamSubscription<int> _subscription;
  String _stepCountValue;

  void onData(int stepCountValue) {
    print(stepCountValue);
  }

  void startListening() {
    print('litening ..');
    _pedometer = new Pedometer();
    _subscription = _pedometer.pedometerStream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: true);
  }

  void stopListening() {
    _subscription.cancel();
  }

  void _onData(int stepCountValue) async {
//    _pedometer = new Pedometer();
    setState(() {
      _stepCountValue = "$stepCountValue";
    });
  }

  void _onDone() => print("Finished pedometer tracking");

  void _onError(error) => print("Flutter Pedometer Error: $error");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startListening();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF212429), Color(0xFF2A2D32)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch

        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: kCircleBG_width,
                  height: kCircleBG_width,
                  decoration: new BoxDecoration(
                    color: Color(0xFF44474D),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'STEPS',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$_stepCountValue',
                        style: TextStyle(
                          fontSize: 100.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
