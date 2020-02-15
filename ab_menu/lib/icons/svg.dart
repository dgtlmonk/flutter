import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const kIconW = 44.0;
const kIconH = 76.0;
const kIconColor = Colors.white;

final Widget SVGKeto = SvgPicture.asset('images/svg/keto.svg',
    width: kIconW, height: kIconH, color: kIconColor);

final Widget SVGVegan = SvgPicture.asset(
  'images/svg/vegan.svg',
  width: kIconW,
  height: kIconH,
  color: kIconColor,
);

final Widget SVGBalanced = SvgPicture.asset('images/svg/balanced.svg',
    width: kIconW, height: kIconH, color: kIconColor);

final Widget SVGDetox = SvgPicture.asset('images/svg/detox.svg',
    width: kIconW, height: kIconH, color: kIconColor);
final Widget SVGPescatarian = SvgPicture.asset('images/svg/pescatarian.svg',
    width: kIconW, height: kIconH, color: kIconColor);
