import 'package:ab_menu/components/product_menu_btn.dart';
import 'package:ab_menu/config/ui/menu.dart';
import 'package:flutter/material.dart';

class SpreadsMenu extends StatefulWidget {
  SpreadsMenu({
    this.activeMenu = "cakes",
    this.onCategorySelect,
  });
  dynamic activeMenu;
  final Function onCategorySelect;

  @override
  _SpreadsMenuState createState() => _SpreadsMenuState();
}

class _SpreadsMenuState extends State<SpreadsMenu> {
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
                itemCount: spreadsUIConfig.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = spreadsUIConfig.keys.elementAt(index);

                  return ProductMenuButton(
                      onMenuTap: () {
                        widget.onCategorySelect(spreadsUIConfig[key]["key"]);
                        setState(() {
                          widget.activeMenu = spreadsUIConfig[key]["key"];
                        });
                      },
                      svgIcon: spreadsUIConfig[key]["icon"](
                          isActive:
                              widget.activeMenu == spreadsUIConfig[key]["key"]),
                      label: spreadsUIConfig[key]["label"],
                      isActive:
                          widget.activeMenu == spreadsUIConfig[key]["key"]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
