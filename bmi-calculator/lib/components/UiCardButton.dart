import 'package:bmi_calculator/components/UiCard.dart';
import 'package:flutter/material.dart';

class UiCardButton extends StatelessWidget {
  UiCardButton({this.color, this.label, this.icon, this.isActive});

  final String label;
  final Color color;
  final IconData icon;
  final bool isActive;

  final Color inactiveColor = Color(0xFF6E6F7F);
  final Color activeColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return UiCard(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 80.0,
            color: isActive ? activeColor : inactiveColor,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: isActive ? activeColor : inactiveColor),
          )
        ],
      ),
    );
  }
}
