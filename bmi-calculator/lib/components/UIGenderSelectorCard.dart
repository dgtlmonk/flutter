import 'package:bmi_calculator/components/UiCardButton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderSelectorCard extends StatelessWidget {
  GenderSelectorCard({this.gender, this.isActive, this.onTap});

  final Gender gender;
  final bool isActive;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return UiCardButton(
      icon: gender == Gender.male
          ? FontAwesomeIcons.mars
          : FontAwesomeIcons.venus,
      isActive: isActive,
      label: gender == Gender.male ? 'MALE' : 'FEMALE',
      onTap: () => onTap(),
    );
  }
}
