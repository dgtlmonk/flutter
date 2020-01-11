import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RawMaterialButton(
        child: Icon(
          icon,
          size: 12.0,
        ),
        shape: CircleBorder(),
        elevation: 6.0,
        fillColor: Color(0xFF272B55),
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
      ),
    );
  }
}
