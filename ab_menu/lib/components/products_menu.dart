import 'package:ab_menu/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsMenu extends StatelessWidget {
  const ProductsMenu({
    Key key,
    this.onMenuSelect,
  }) : super(key: key);

  final Function onMenuSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
//      Color(0xFFd35127),
      color: Color(0xFF232020),
      width: 180.0,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ProductMenuButton(
            label: 'SIGNATURE MEALS',
            imgSrc: AssetImage('images/menu/signature.jpg'),
            onMenuSelect: () => onMenuSelect(Products.signature),
          ),
          ProductMenuButton(
            label: 'HEALTHY DRINKS',
            imgSrc: AssetImage('images/menu/drinks.jpg'),
            onMenuSelect: () => onMenuSelect(Products.drinks),
          ),
          ProductMenuButton(
            label: 'HEALTHY TREATS',
            imgSrc: AssetImage('images/menu/treats.jpg'),
            onMenuSelect: () => onMenuSelect(Products.treats),
          ),
          ProductMenuButton(
            label: 'FROZEN PRODUCTS',
            imgSrc: AssetImage('images/menu/frozen.jpg'),
            onMenuSelect: () => onMenuSelect(Products.frozen),
          ),
          ProductMenuButton(
            label: 'SPREAD & SAUCES',
            imgSrc: AssetImage('images/menu/spread.jpg'),
            onMenuSelect: () => onMenuSelect(Products.spread),
          ),
          ProductMenuButton(
            label: 'PROTEIN ADD-ON',
            imgSrc: AssetImage('images/menu/add-on.jpg'),
            onMenuSelect: () => onMenuSelect(Products.addon),
          ),
          ProductMenuButton(
            label: 'DETOX SOUP',
            imgSrc: AssetImage('images/menu/detox.jpg'),
            onMenuSelect: () => onMenuSelect(Products.detox_soup),
          ),
        ],
      ),
    );
  }
}

class ProductMenuButton extends StatelessWidget {
  ProductMenuButton({this.label, this.imgSrc, this.menu, this.onMenuSelect});

  final String label;
  final AssetImage imgSrc;
  final Function onMenuSelect;
  final dynamic menu;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onMenuSelect();
      },
      child: Column(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            margin: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 4.0),
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(kBordeRadius),
              ),
              image: DecorationImage(
                image: this.imgSrc,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            this.label,
            style: GoogleFonts.voltaire(
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 40.0,
          )
        ],
      ),
    );
  }
}
