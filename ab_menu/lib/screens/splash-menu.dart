import 'package:ab_menu/config/config.dart';
import 'package:ab_menu/screens/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

final kBordeRadius = 15.0;

class SplashMenu extends StatelessWidget {
  static const id = "carousel menu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  'version ' + version,
                  style: TextStyle(color: Colors.blueGrey),
                ),
                Flexible(
                  child: new Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Material(
                        color: Colors.black,
                        elevation: 10.0,
                        borderRadius: BorderRadius.all(
                          Radius.circular(kBordeRadius),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'images/carousel/cover-$index.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(kBordeRadius),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 4,
                    itemHeight: 450.0,
                    itemWidth: 450.0,
                    scale: .2,
                    layout: SwiperLayout.STACK,
                    pagination: new SwiperPagination(),
                    onTap: (int index) {
                      print("$index seleted");
                      Navigator.pushNamed(context, MenuScreen.id);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
