import 'package:ab_menu/components/product_menu_btn.dart';
import 'package:ab_menu/constants.dart';
import 'package:ab_menu/icons/svg.dart';
import 'package:flutter/material.dart';

class SignatureMenu extends StatefulWidget {
  SignatureMenu({this.activeMenu = SignatureMeals.keto, this.onMenuSelect});
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
                  ProductMenuButton(
                    onMenuTap: () {
                      widget.onMenuSelect(SignatureMeals.keto);
                      setState(() {
                        widget.activeMenu = SignatureMeals.keto;
                      });
                    },
                    svgIcon: SvgKeto(
                        isActive: widget.activeMenu == SignatureMeals.keto,
                        width: 38.0,
                        height: 70.0),
                    label: 'Healthy Keto',
                    isActive: widget.activeMenu == SignatureMeals.keto,
                  ),
                  ProductMenuButton(
                      onMenuTap: () {
                        widget.onMenuSelect(SignatureMeals.vegan);
                        setState(() {
                          widget.activeMenu = SignatureMeals.vegan;
                        });
                      },
                      svgIcon: SvgVegan(
                          isActive: widget.activeMenu == SignatureMeals.vegan),
                      label: 'Healthy Vegan',
                      isActive: widget.activeMenu == SignatureMeals.vegan),
                  ProductMenuButton(
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
                  ProductMenuButton(
                    onMenuTap: () {
                      widget.onMenuSelect(SignatureMeals.detox);
                      setState(() {
                        widget.activeMenu = SignatureMeals.detox;
                      });
                    },
                    svgIcon: SvgDetox(
                        isActive: widget.activeMenu == SignatureMeals.detox),
                    label: 'Detox Salads',
                    isActive: widget.activeMenu == SignatureMeals.detox,
                  ),
                  ProductMenuButton(
                    onMenuTap: () {
                      widget.onMenuSelect(SignatureMeals.pescatarian);
                      setState(() {
                        widget.activeMenu = SignatureMeals.pescatarian;
                      });
                    },
                    svgIcon: SvgPescatarian(
                        isActive:
                            widget.activeMenu == SignatureMeals.pescatarian),
                    label: 'Pescetarian',
                    isActive: widget.activeMenu == SignatureMeals.pescatarian,
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
