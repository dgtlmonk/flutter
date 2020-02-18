import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductMenuButton extends StatelessWidget {
  ProductMenuButton({
    this.svgIcon,
    this.label,
    this.isActive = false,
    this.onMenuTap,
  });

  final Widget svgIcon;
  final String label;
  final bool isActive;
  final Function onMenuTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.onMenuTap(),
      child: Container(
        width: 120.0,
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: isActive ? Color(0xFFd35127) : Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF231f20).withOpacity(0.3),
                offset: new Offset(1.0, 1.0),
                blurRadius: 15.0,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: this.svgIcon,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              this.label,
              style: GoogleFonts.droidSans(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: isActive ? Colors.white : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
