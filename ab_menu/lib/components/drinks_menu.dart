import 'package:ab_menu/components/product_menu_btn.dart';
import 'package:ab_menu/config/ui/menu.dart';
import 'package:ab_menu/constants.dart';
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

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: drinksUIConfig.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = drinksUIConfig.keys.elementAt(index);

                  return ProductMenuButton(
                      onMenuTap: () {
                        widget.onCategorySelect(drinksUIConfig[key]["key"]);
                        setState(() {
                          widget.activeMenu = drinksUIConfig[key]["key"];
                        });
                      },
                      svgIcon: drinksUIConfig[key]["icon"](
                          isActive:
                              widget.activeMenu == drinksUIConfig[key]["key"]),
                      label: drinksUIConfig[key]["label"],
                      isActive:
                          widget.activeMenu == drinksUIConfig[key]["key"]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
