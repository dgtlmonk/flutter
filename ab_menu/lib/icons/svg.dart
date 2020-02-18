import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// TODO: make this dynamic
const kIconW = 44.0;
const kIconH = 76.0;

const kIconColor = Color(0xFFd35127); // Colors.white;
const kIconColorActive = Colors.white;

SvgPicture _generateSVGIcon(
    String src, bool isActive, double width, double height) {
  return SvgPicture.asset(src,
      width: width ?? kIconW,
      height: height ?? kIconH,
      color: isActive ? kIconColorActive : kIconColor);
}

// TODO: Refactor
SvgKeto<Widget>({bool isActive = false, double width, double height}) {
  return SvgPicture.asset('images/svg/keto.svg',
      width: width ?? kIconW,
      height: height ?? kIconH,
      color: isActive ? kIconColorActive : kIconColor);
}

SvgVegan<Widget>({bool isActive = false, double width, double height}) {
  return SvgPicture.asset('images/svg/vegan.svg',
      width: width ?? kIconW,
      height: height ?? kIconH,
      color: isActive ? kIconColorActive : kIconColor);
}

SvgMilkTea<Widget>({bool isActive = false, double width, double height}) {
  return _generateSVGIcon('images/svg/milk-tea.svg', isActive, width, height);
}

SvgLemonAid<Widget>({bool isActive = false, double width, double height}) {
  return _generateSVGIcon('images/svg/lemon-aid.svg', isActive, width, height);
}

SvgBalanced<Widget>({bool isActive = false, double width, double height}) {
  return SvgPicture.asset('images/svg/balanced.svg',
      width: width ?? kIconW,
      height: height ?? kIconH,
      color: isActive ? kIconColorActive : kIconColor);
}

SvgDetox<Widget>({bool isActive = false, double width, double height}) {
  return SvgPicture.asset('images/svg/detox.svg',
      width: width ?? kIconW,
      height: height ?? kIconH,
      color: isActive ? kIconColorActive : kIconColor);
}

SvgPescatarian<Widget>({bool isActive = false, double width, double height}) {
  return SvgPicture.asset('images/svg/pescatarian.svg',
      width: width ?? kIconW,
      height: height ?? kIconH,
      color: isActive ? kIconColorActive : kIconColor);
}

SvgColdBew<Widget>({bool isActive = false, double width, double height}) {
  return SvgPicture.asset('images/svg/brew.svg',
      width: width ?? kIconW,
      height: height ?? kIconH,
      color: isActive ? kIconColorActive : kIconColor);
}
