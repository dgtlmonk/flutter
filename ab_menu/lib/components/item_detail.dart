import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        print('ok');
      },
      child: Card(
          elevation: 6.0,
          child: Container(
            width: 350.0,
            height: 300.0,
            child: Column(
              children: <Widget>[
                Image.network(
                  'http://via.placeholder.com/350x180',
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 130.0,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Wagyu kare-kare with cauliflower shrimp rice - P450.00',
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
                        '411kcal (F 35g C 0g P 24g) \nSodium - 225mg',
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
          )),
    );
  }
}
