import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const kIconW = 44.0;
const kIconH = 76.0;
const kIconColor = Color(0xFFd35127); // Colors.white;
const kIconColorActive = Colors.white;

// TODO: Refactor
SvgKeto<Widget>({bool isActive = false}) {
  return SvgPicture.asset('images/svg/keto.svg',
      width: kIconW,
      height: kIconH,
      color: isActive ? kIconColorActive : kIconColor);
}

SvgVegan<Widget>({
  bool isActive = false,
}) {
  return SvgPicture.asset('images/svg/vegan.svg',
      width: kIconW,
      height: kIconH,
      color: isActive ? kIconColorActive : kIconColor);
}

SvgBalanced<Widget>({
  bool isActive = false,
}) {
  return SvgPicture.asset('images/svg/balanced.svg',
      width: kIconW,
      height: kIconH,
      color: isActive ? kIconColorActive : kIconColor);
}

SvgDetox<Widget>({
  bool isActive = false,
}) {
  return SvgPicture.asset('images/svg/detox.svg',
      width: kIconW,
      height: kIconH,
      color: isActive ? kIconColorActive : kIconColor);
}

SvgPescatarian<Widget>({
  bool isActive = false,
}) {
  return SvgPicture.asset('images/svg/pescatarian.svg',
      width: kIconW,
      height: kIconH,
      color: isActive ? kIconColorActive : kIconColor);
}

//class SVGWidget extends StatelessWidget {
//  SVGWidget({this.isActive = false, this.tag});
//  final bool isActive;
//  final String tag;
//
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}
