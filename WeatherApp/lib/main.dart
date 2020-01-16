import 'package:clima/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xFFDEE7EF), //Color(0xFFD9E7FE),
      ),
      home: SafeArea(
        child: LoadingScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
