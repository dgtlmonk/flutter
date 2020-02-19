import 'package:ab_menu/components/product_menu_btn.dart';
import 'package:ab_menu/config/ui/menu.dart';
import 'package:flutter/material.dart';

class TreatsMenu extends StatefulWidget {
  TreatsMenu({
    this.activeMenu = "cakes",
    this.onCategorySelect,
  });
  dynamic activeMenu;
  final Function onCategorySelect;

  @override
  _TreatsMenuState createState() => _TreatsMenuState();
}

class _TreatsMenuState extends State<TreatsMenu> {
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
                itemCount: treatsUIConfig.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = treatsUIConfig.keys.elementAt(index);

                  return ProductMenuButton(
                      onMenuTap: () {
                        widget.onCategorySelect(treatsUIConfig[key]["key"]);
                        setState(() {
                          widget.activeMenu = treatsUIConfig[key]["key"];
                        });
                      },
                      svgIcon: treatsUIConfig[key]["icon"](
                          isActive:
                              widget.activeMenu == treatsUIConfig[key]["key"]),
                      label: treatsUIConfig[key]["label"],
                      isActive:
                          widget.activeMenu == treatsUIConfig[key]["key"]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
