import 'package:ab_menu/components/product_menu_btn.dart';
import 'package:ab_menu/config/ui/ui.dart';
import 'package:ab_menu/constants.dart';
import 'package:flutter/material.dart';

class TreatsMenu extends StatefulWidget {
  TreatsMenu({
    this.activeMenu = SignatureMeals.keto,
    this.onMenuSelect,
  });
  dynamic activeMenu;
  final Function onMenuSelect;

  @override
  _TreatsMenuState createState() => _TreatsMenuState();
}

class _TreatsMenuState extends State<TreatsMenu> {
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
                itemCount: treatsUIConfig.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = treatsUIConfig.keys.elementAt(index);

                  return ProductMenuButton(
                    onMenuTap: () {
                      widget.onMenuSelect(SignatureMeals.keto);
                      setState(() {
                        widget.activeMenu = SignatureMeals.keto;
                      });
                    },
                    svgIcon: treatsUIConfig[key]["icon"](
                      isActive: widget.activeMenu == SignatureMeals.keto,
                    ),
                    label: treatsUIConfig[key]['label'],
                    isActive: widget.activeMenu == SignatureMeals.keto,
                  );
                },
              ),

//              child: ListView(
//                scrollDirection: Axis.horizontal,

//                children: <Widget>[
//                  ProductMenuButton(
//                    onMenuTap: () {
//                      widget.onMenuSelect(SignatureMeals.keto);
//                      setState(() {
//                        widget.activeMenu = SignatureMeals.keto;
//                      });
//                    },
//                    svgIcon: SvgCake(
//                      isActive: widget.activeMenu == SignatureMeals.keto,
//                    ),
//                    label: 'Cakes',
//                    isActive: widget.activeMenu == SignatureMeals.keto,
//                  ),
//                  ProductMenuButton(
//                      onMenuTap: () {
//                        widget.onMenuSelect(SignatureMeals.vegan);
//                        setState(() {
//                          widget.activeMenu = SignatureMeals.vegan;
//                        });
//                      },
//                      svgIcon: SvgPotatoChips(
//                          isActive: widget.activeMenu == Treats.protein_chips),
//                      label: 'Protein Chips',
//                      isActive: widget.activeMenu == Treats.protein_chips),
//                  ProductMenuButton(
//                    onMenuTap: () {
//                      widget.onMenuSelect(Treats.milk_tea);
//                      setState(() {
//                        widget.activeMenu = Treats.milk_tea;
//                      });
//                    },
//                    svgIcon: SvgMilkTea(
//                      isActive: widget.activeMenu == Treats.milk_tea,
//                    ),
//                    label: 'Milk Tea',
//                    isActive: widget.activeMenu == Treats.milk_tea,
//                  ),
//                ],
//              ),
            ),
          ),
        ],
      ),
    );
  }
}
