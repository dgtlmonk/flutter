import 'package:ab_menu/icons/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kBordeRadius = 15.0;

Color _randomColor(int index) {
  if (index % 3 == 0) {
    return Colors.pink;
  } else if (index % 3 == 1) {
    return Colors.blueAccent;
  }

  return Colors.amber;
}

class MenuScreen extends StatefulWidget {
  static const id = "menu";

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff4f4f5),
        resizeToAvoidBottomPadding: false,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CategoryMenu(),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                      height: 200.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          MenuButton(
                            svgIcon: SVGKeto,
                            label: 'Healthy Keto',
                            isActive: true,
                          ),
                          MenuButton(
                            svgIcon: SVGVegan,
                            label: 'Healthy Vegan',
                          ),
                          MenuButton(
                            svgIcon: SVGBalanced,
                            label: 'Balanced',
                          ),
                          MenuButton(
                            svgIcon: SVGDetox,
                            label: 'Detox Salads',
                          ),
                          MenuButton(
                            svgIcon: SVGPescatarian,
                            label: 'Pescetarian',
                          ),
                        ],
                      )),

                  // bottom view
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Flexible(
                          child: CustomScrollView(
                            slivers: <Widget>[
                              SliverGrid(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                ),
//                                delegate: SliverChildBuilderDelegate(
//                                    (BuildContext context, int index) {
//                                  return new ItemDetailCard();
//                                }),
                                delegate: SliverChildListDelegate([
                                  ItemDetailCard(),
                                  ItemDetailCard(),
                                  ItemDetailCard(),
                                  ItemDetailCard(),
                                  ItemDetailCard(),
                                  ItemDetailCard(),
                                  ItemDetailCard(),
                                ]),
                              ),

//                  ItemDetailCard(),
//                              SliverToBoxAdapter(
//                                child: SizedBox(
//                                  height: 100,
//                                  child: Center(
//                                    child: Text('Main content here'),
//                                  ),
//                                ),
//                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class ItemDetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Card(
          elevation: 10.0,
          child: Container(
            width: 300.0,
            child: Column(
              children: <Widget>[
                Image.network(
                  'http://via.placeholder.com/300x180',
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
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

class MenuButton extends StatelessWidget {
  MenuButton({this.svgIcon, this.label, this.isActive = false});

  final Widget svgIcon;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: GestureDetector(
        onTap: () {
          print('${label} pressed');
        },
        child: Container(
          width: 140.0,
          height: 160.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: isActive ? Color(0xFFFFFFFF) : Color(0xFFd35127),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF231f20).withOpacity(0.3),
                  offset: new Offset(1.0, 1.0),
                  blurRadius: 15.0,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: this.svgIcon,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                this.label,
                style: GoogleFonts.droidSans(
                  textStyle: Theme.of(context).textTheme.display1,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: isActive ? Color(0xFF414042) : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryMenu extends StatelessWidget {
  const CategoryMenu({
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
          CategoryMenuWidget(
            label: 'SIGNATURE MEALS',
            imgSrc: AssetImage('images/menu/signature.jpg'),
          ),
          CategoryMenuWidget(
            label: 'HEALTHY DRINKS',
            imgSrc: AssetImage('images/menu/drinks.jpg'),
          ),
          CategoryMenuWidget(
            label: 'HEALTHY TREATS',
            imgSrc: AssetImage('images/menu/treats.jpg'),
          ),
          CategoryMenuWidget(
            label: 'HEALTHY TREATS',
            imgSrc: AssetImage('images/menu/treats.jpg'),
          ),
          CategoryMenuWidget(
            label: 'HEALTHY TREATS',
            imgSrc: AssetImage('images/menu/treats.jpg'),
          ),
          SizedBox(
            height: 40.0,
          )
        ],
      ),
    );
  }
}

class CategoryMenuWidget extends StatelessWidget {
  CategoryMenuWidget({this.label, this.imgSrc});

  final String label;
  final AssetImage imgSrc;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
