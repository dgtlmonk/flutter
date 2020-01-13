import 'package:flutter/cupertino.dart';

const kUICardBgColor = Color(0xFF1C1E33);
const kUIGenderBgColor = Color(0xFF1C1E33);
const double kCalcButtonHeight = 80;
const int kMinAge = 12;
const int kMaxAge = 120;

// cm
const double kMinHeight = 120.0;
const double kMaxHeight = 280.0;

// kg
const int kMinWeight = 60;

enum Gender { male, female }
enum Operation { increment, decrement }

const kInputValueTextStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 50,
);

const kInputLabelTextStyle = TextStyle(
  fontWeight: FontWeight.w800,
  fontSize: 18.0,
);
