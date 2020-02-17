import 'package:ab_menu/constants.dart';
import 'package:ab_menu/icons/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignatureMenu extends StatefulWidget {
  SignatureMenu({this.activeMenu = signatureMeals.keto, this.onMenuSelect});
  dynamic activeMenu;
  final Function onMenuSelect;

  @override
  _SignatureMenuState createState() => _SignatureMenuState();
}

class _SignatureMenuState extends State<SignatureMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff4f4f5),
      padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // TODO: for ListView params
        // scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryMenuButton(
            onMenuTap: () {
              widget.onMenuSelect(signatureMeals.keto);
              setState(() {
                widget.activeMenu = signatureMeals.keto;
              });
            },
            svgIcon:
                SvgKeto(isActive: widget.activeMenu == signatureMeals.keto),
            label: 'Healthy Keto',
            isActive: widget.activeMenu == signatureMeals.keto,
          ),
          CategoryMenuButton(
              onMenuTap: () {
                widget.onMenuSelect(signatureMeals.vegan);
                setState(() {
                  widget.activeMenu = signatureMeals.vegan;
                });
              },
              svgIcon:
                  SvgVegan(isActive: widget.activeMenu == signatureMeals.vegan),
              label: 'Healthy Vegan',
              isActive: widget.activeMenu == signatureMeals.vegan),
          CategoryMenuButton(
            onMenuTap: () {
              widget.onMenuSelect(signatureMeals.balanced);
              setState(() {
                widget.activeMenu = signatureMeals.balanced;
              });
            },
            svgIcon: SvgBalanced(
              isActive: widget.activeMenu == signatureMeals.balanced,
            ),
            label: 'Balanced',
            isActive: widget.activeMenu == signatureMeals.balanced,
          ),
          CategoryMenuButton(
            onMenuTap: () {
              widget.onMenuSelect(signatureMeals.detox);
              setState(() {
                widget.activeMenu = signatureMeals.detox;
              });
            },
            svgIcon:
                SvgDetox(isActive: widget.activeMenu == signatureMeals.detox),
            label: 'Detox Salads',
            isActive: widget.activeMenu == signatureMeals.detox,
          ),
          CategoryMenuButton(
            onMenuTap: () {
              widget.onMenuSelect(signatureMeals.pescatarian);
              setState(() {
                widget.activeMenu = signatureMeals.pescatarian;
              });
            },
            svgIcon: SvgPescatarian(
                isActive: widget.activeMenu == signatureMeals.pescatarian),
            label: 'Pescetarian',
            isActive: widget.activeMenu == signatureMeals.pescatarian,
          ),
        ],
      ),
    );
  }
}

class CategoryMenuButton extends StatelessWidget {
  CategoryMenuButton({
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
    return FlatButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        this.onMenuTap();
      },
      child: GestureDetector(
        child: Container(
          width: 140.0,
          height: 140.0,
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
      ),
    );
  }
}
