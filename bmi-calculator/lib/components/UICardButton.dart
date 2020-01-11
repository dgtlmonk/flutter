import 'package:bmi_calculator/components/UICard.dart';
import 'package:flutter/material.dart';

const inactiveBgColor = Color(0xFF0F1327);
const activeBgColor = Color(0xFF1D1E33);

class UiCardButton extends StatelessWidget {
  UiCardButton({
    this.label,
    this.icon,
    this.isActive,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isActive;
  final Function onTap;

  final Color inactiveColor = Color(0xFF6E6F7F);
  final Color activeColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: UiCard(
        color: isActive ? activeBgColor : inactiveBgColor,
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
      ),
    );
  }
}
