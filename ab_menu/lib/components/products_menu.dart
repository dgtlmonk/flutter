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
      color: Color(0xFF232020),
      padding: EdgeInsets.all(0.0),
      width: 180.0,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          ProductMenuButton(
            isActive: true,
            label: 'SIGNATURE MEALS',
            imgSrc: AssetImage('images/menu/signature.jpg'),
            onMenuSelect: () => onMenuSelect(Products.signature),
          ),
          ProductMenuButton(
            isActive: false,
            label: 'HEALTHY DRINKS',
            imgSrc: AssetImage('images/menu/drinks.jpg'),
            onMenuSelect: () => onMenuSelect(Products.drinks),
          ),
          ProductMenuButton(
            isActive: false,
            label: 'HEALTHY TREATS',
            imgSrc: AssetImage('images/menu/treats.jpg'),
            onMenuSelect: () => onMenuSelect(Products.treats),
          ),
          ProductMenuButton(
            isActive: false,
            label: 'FROZEN PRODUCTS',
            imgSrc: AssetImage('images/menu/frozen.jpg'),
            onMenuSelect: () => onMenuSelect(Products.frozen),
          ),
          ProductMenuButton(
            isActive: false,
            label: 'SPREAD & SAUCES',
            imgSrc: AssetImage('images/menu/spread.jpg'),
            onMenuSelect: () => onMenuSelect(Products.spreads),
          ),
          ProductMenuButton(
            isActive: false,
            label: 'PROTEIN ADD-ON',
            imgSrc: AssetImage('images/menu/add-on.jpg'),
            onMenuSelect: () => onMenuSelect(Products.addon),
          ),
          ProductMenuButton(
            isActive: false,
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
  ProductMenuButton({
    this.label,
    this.imgSrc,
    this.menu,
    this.onMenuSelect,
    this.isActive,
  });

  final String label;
  final AssetImage imgSrc;
  final Function onMenuSelect;
  final bool isActive;
  final dynamic menu;

  final _kMargin = 16.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          onMenuSelect();
        },
        child: Container(
          color: isActive ? Color(0xFFd35127) : Colors.transparent,
          margin: EdgeInsets.only(
//            top: _kMargin,
//            bottom: _kMargin,
              ),
          padding: EdgeInsets.only(
            top: _kMargin,
            bottom: _kMargin,
          ),
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
            ],
          ),
        ),
      ),
    );
  }
}
