import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ItemDetailCard extends StatelessWidget {
  ItemDetailCard({
    Key key,
    this.item,
  }) : super(key: key);

  final Map item;

  final currencyFormatter = NumberFormat('P#,###,###.00', 'en_PH');

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6.0,
        child: Container(
          // SliverGrid handles the height?
//          width: 350.0,
//          height: 130.0,
          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                item["src"] ?? 'images/products/no-preview.jpg',
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      item["name"] +
                          " - " +
                          currencyFormatter.format(item["price"]),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          item["macro"],
                          style: GoogleFonts.droidSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF808285),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
