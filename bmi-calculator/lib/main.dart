import 'package:bmi_calculator/components/BMIResult.dart';
import 'package:flutter/material.dart';

// TODO: add an option to switch units (e.g. cm > ft, lbs > kg)
void main() => runApp(BMICalculatorInput());

class BMICalculatorInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090B21),
        buttonColor: Color(0xFFEA1456),
        scaffoldBackgroundColor: Color(0xFF090C1F),

        // slider
//        sliderTheme: SliderTheme.of(context).copyWith(
//          activeTrackColor: Colors.white,
//          thumbColor: Color(0xFFEB1555),
//          overlayColor: Color(0x29EB1555),
//          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18.0),
//          overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
//        ),
      ),
//      home: BmiInputView(),
      home: BmiResultView(),
    );
  }
}
