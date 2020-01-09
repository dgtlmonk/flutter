import 'package:bmi_calculator/components/BmiInput.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090B21),
        buttonColor: Color(0xFFEA1456),
        scaffoldBackgroundColor: Color(0xFF090C1F),
      ),
      home: BmiInputView(),
    );
  }
}
