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
//      margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              // TODO: Make dynamic
              height: 160.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CategoryMenuButton(
                    onMenuTap: () {
                      widget.onMenuSelect(SignatureMeals.keto);
                      setState(() {
                        widget.activeMenu = SignatureMeals.keto;
                      });
                    },
                    svgIcon: SvgColdBew(
                        isActive: widget.activeMenu == SignatureMeals.keto,
                        width: 38.0,
                        height: 70.0),
                    label: 'Cold Brew',
                    isActive: widget.activeMenu == SignatureMeals.keto,
                  ),
                  CategoryMenuButton(
                      onMenuTap: () {
                        widget.onMenuSelect(SignatureMeals.vegan);
                        setState(() {
                          widget.activeMenu = SignatureMeals.vegan;
                        });
                      },
                      svgIcon: SvgMilkTea(
                          isActive: widget.activeMenu == SignatureMeals.vegan),
                      label: 'Milk Tea',
                      isActive: widget.activeMenu == SignatureMeals.vegan),
                  CategoryMenuButton(
                    onMenuTap: () {
                      widget.onMenuSelect(SignatureMeals.balanced);
                      setState(() {
                        widget.activeMenu = SignatureMeals.balanced;
                      });
                    },
                    svgIcon: SvgLemonAid(
                      isActive: widget.activeMenu == SignatureMeals.balanced,
                    ),
                    label: 'Lemon AID',
                    isActive: widget.activeMenu == SignatureMeals.balanced,
                  ),
                ],
              ),
            ),
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
