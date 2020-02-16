import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDetailCard extends StatelessWidget {
  ItemDetailCard({this.item});
  final Map item;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6.0,
        child: Container(
          // SliverGrid handles the height?
//          width: 350.0,
//          height: 300.0,
          child: Column(
            children: <Widget>[
              Image.asset(
                item["src"] ?? 'images/products/no-preview.jpg',
                fit: BoxFit.cover,
              ),
              Container(
//                height: 130.0,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      item["name"],
                      style: GoogleFonts.droidSans(
                        textStyle: Theme.of(context).textTheme.display1,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF414042),
                      ),
                    ),
                    new Divider(
                      color: Colors.grey,
                    ),
                    Text(
                      item["macro"],
                      style: GoogleFonts.droidSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF808285),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
