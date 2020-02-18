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

SvgKeto<Widget>({bool isActive = false, double width, double height}) {
  return _generateSVGIcon('images/svg/keto.svg', isActive, width, height);
}

SvgVegan<Widget>({bool isActive = false, double width, double height}) {
  return _generateSVGIcon('images/svg/vegan.svg', isActive, width, height);
}

SvgMilkTea<Widget>({bool isActive = false, double width, double height}) {
  return _generateSVGIcon('images/svg/milk-tea.svg', isActive, width, height);
}

SvgLemonAid<Widget>({bool isActive = false, double width, double height}) {
  return _generateSVGIcon('images/svg/lemon-aid.svg', isActive, width, height);
}

SvgBalanced<Widget>({bool isActive = false, double width, double height}) {
  return _generateSVGIcon('images/svg/balanced.svg', isActive, width, height);
}

SvgDetox<Widget>({bool isActive = false, double width, double height}) {
  return _generateSVGIcon('images/svg/detox.svg', isActive, width, height);
}

SvgCake<Widget>({bool isActive = false, double width, double height}) {
  return _generateSVGIcon('images/svg/cake.svg', isActive, width, height);
}

SvgProteinChips<Widget>({bool isActive = false, double width, double height}) {
  return _generateSVGIcon(
      'images/svg/potato-chips.svg', isActive, width, height);
}

SvgPescatarian<Widget>({bool isActive = false, double width, double height}) {
  return _generateSVGIcon(
      'images/svg/pescatarian.svg', isActive, width, height);
}

SvgColdBew<Widget>({bool isActive = false, double width, double height}) {
  return _generateSVGIcon('images/svg/brew.svg', isActive, width, height);
}
