import 'package:ab_menu/components/product_menu_btn.dart';
import 'package:ab_menu/config/ui/menu.dart';
import 'package:ab_menu/constants.dart';
import 'package:flutter/material.dart';

class SignatureMenu extends StatefulWidget {
  SignatureMenu({this.activeMenu = SignatureMeals.keto, this.onCategorySelect});
  dynamic activeMenu;
  final Function onCategorySelect;

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

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: signatureUIConfig.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = signatureUIConfig.keys.elementAt(index);
                  print(key.toString());

                  return ProductMenuButton(
                      onMenuTap: () {
                        widget.onCategorySelect(signatureUIConfig[key]["key"]);
                        setState(() {
                          widget.activeMenu = signatureUIConfig[key]["key"];
                        });
                      },
                      svgIcon: signatureUIConfig[key]["icon"](
                          isActive: widget.activeMenu ==
                              signatureUIConfig[key]["key"]),
                      label: signatureUIConfig[key]["label"],
                      isActive:
                          widget.activeMenu == signatureUIConfig[key]["key"]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
