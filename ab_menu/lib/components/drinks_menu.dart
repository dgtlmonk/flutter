import 'package:ab_menu/constants.dart';
import 'package:ab_menu/icons/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrinksMenu extends StatefulWidget {
  DrinksMenu({this.activeMenu = SignatureMeals.keto, this.onMenuSelect});
  dynamic activeMenu;
  final Function onMenuSelect;

  @override
  _DrinksMenuState createState() => _DrinksMenuState();
}

class _DrinksMenuState extends State<DrinksMenu> {
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
                widget.onMenuSelect(Drinks.cold_brew);
                setState(() {
                  widget.activeMenu = Drinks.cold_brew;
                });
              },
              svgIcon:
                  SvgColdBew(isActive: widget.activeMenu == Drinks.cold_brew),
              label: 'Cold Brew',
              isActive: widget.activeMenu == Drinks.cold_brew),
          CategoryMenuButton(
              onMenuTap: () {
                widget.onMenuSelect(SignatureMeals.vegan);
                setState(() {
                  widget.activeMenu = SignatureMeals.vegan;
                });
              },
              svgIcon:
                  SvgVegan(isActive: widget.activeMenu == SignatureMeals.vegan),
              label: 'Healthy Vegan',
              isActive: widget.activeMenu == SignatureMeals.vegan),
          CategoryMenuButton(
            onMenuTap: () {
              widget.onMenuSelect(SignatureMeals.balanced);
              setState(() {
                widget.activeMenu = SignatureMeals.balanced;
              });
            },
            svgIcon: SvgBalanced(
              isActive: widget.activeMenu == SignatureMeals.balanced,
            ),
            label: 'Balanced',
            isActive: widget.activeMenu == SignatureMeals.balanced,
          ),
          CategoryMenuButton(
            onMenuTap: () {
              widget.onMenuSelect(SignatureMeals.detox);
              setState(() {
                widget.activeMenu = SignatureMeals.detox;
              });
            },
            svgIcon:
                SvgDetox(isActive: widget.activeMenu == SignatureMeals.detox),
            label: 'Detox Salads',
            isActive: widget.activeMenu == SignatureMeals.detox,
          ),
          CategoryMenuButton(
            onMenuTap: () {
              widget.onMenuSelect(SignatureMeals.pescatarian);
              setState(() {
                widget.activeMenu = SignatureMeals.pescatarian;
              });
            },
            svgIcon: SvgPescatarian(
                isActive: widget.activeMenu == SignatureMeals.pescatarian),
            label: 'Pescetarian',
            isActive: widget.activeMenu == SignatureMeals.pescatarian,
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
