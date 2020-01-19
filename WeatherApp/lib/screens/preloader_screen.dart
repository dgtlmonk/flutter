import 'package:clima/widgets/Background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PreloaderScreen extends StatefulWidget {
  @override
  _PreloaderScreenState createState() => _PreloaderScreenState();
}

class _PreloaderScreenState extends State<PreloaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        BackgroundWidget(),
        SpinKitWanderingCubes(
          color: Colors.white,
          size: 50.0,
        ),
      ]),
    );
  }
}
