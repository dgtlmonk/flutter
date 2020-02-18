import 'package:ab_menu/components/product_menu_btn.dart';
import 'package:ab_menu/constants.dart';
import 'package:ab_menu/icons/svg.dart';
import 'package:flutter/material.dart';

class DrinksMenu extends StatefulWidget {
  DrinksMenu({this.activeMenu = SignatureMeals.keto, this.onCategorySelect});
  dynamic activeMenu;
  final Function onCategorySelect;

  @override
  _DrinksMenuState createState() => _DrinksMenuState();
}

class _DrinksMenuState extends State<DrinksMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff4f4f5),
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
                      widget.onCategorySelect(SignatureMeals.keto);
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
                  ProductMenuButton(
                      onMenuTap: () {
                        widget.onCategorySelect(SignatureMeals.vegan);
                        setState(() {
                          widget.activeMenu = SignatureMeals.vegan;
                        });
                      },
                      svgIcon: SvgMilkTea(
                          isActive: widget.activeMenu == SignatureMeals.vegan),
                      label: 'Milk Tea',
                      isActive: widget.activeMenu == SignatureMeals.vegan),
                  ProductMenuButton(
                    onMenuTap: () {
                      widget.onCategorySelect(SignatureMeals.balanced);
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
