import 'package:ab_menu/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsMenu extends StatelessWidget {
  const ProductsMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF232020),
      width: 180.0,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ProductMenuButton(
            label: 'SIGNATURE MEALS',
            imgSrc: AssetImage('images/menu/signature.jpg'),
          ),
          ProductMenuButton(
            label: 'HEALTHY DRINKS',
            imgSrc: AssetImage('images/menu/drinks.jpg'),
          ),
          ProductMenuButton(
            label: 'HEALTHY TREATS',
            imgSrc: AssetImage('images/menu/treats.jpg'),
          ),
          ProductMenuButton(
            label: 'FROZEN PRODUCTS',
            imgSrc: AssetImage('images/menu/frozen.jpg'),
          ),
          ProductMenuButton(
            label: 'SPREAD & SAUCES',
            imgSrc: AssetImage('images/menu/spread.jpg'),
          ),
          ProductMenuButton(
            label: 'PROTEIN ADD-ON',
            imgSrc: AssetImage('images/menu/add-on.jpg'),
          ),
          ProductMenuButton(
            label: 'DETOX SOUP',
            imgSrc: AssetImage('images/menu/detox.jpg'),
          ),
        ],
      ),
    );
  }
}

class ProductMenuButton extends StatelessWidget {
  ProductMenuButton({this.label, this.imgSrc});

  final String label;
  final AssetImage imgSrc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('ok');
        Navigator.pop(context);
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
