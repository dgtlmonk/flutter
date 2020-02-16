import 'dart:async' show Future;
import 'dart:convert';

import 'package:ab_menu/components/item_detail.dart';
import 'package:ab_menu/data/products.dart';
import 'package:ab_menu/icons/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';

final kBordeRadius = 15.0;

const signatureMenu = {
  'keto': 'keto',
  'vegan': 'vegan',
  'detox': 'detox',
  'balanced': 'balanced',
  'pescatarian': 'pescatarian',
};

Future<String> _loadProductsAsset() async {
  return await rootBundle.loadString('data/products.json');
}

Future<List<dynamic>> loadProducts() async {
  String jsonString = await _loadProductsAsset();
  final jsonResponse = json.decode(jsonString);

  return jsonResponse['products'];
}

class MenuScreen extends StatefulWidget {
  static const id = "menu";
  MenuScreen({this.selectedMenu = 'keto'});

  String selectedMenu;
  List signatureMeals;
  List ketoMeals;

  var SelectedProduct = "signature";

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadProducts().then((List<dynamic> products) {
      var _signatureMeals =
          products.where((product) => product["name"] == "Signature Meals");
//      var keto = _signatureMeals.
//          .where((category) => category["categories"] == "Healthy keto");
//      print(_signatureMeals
//          .where((categories) =>
//              categories["categories"]["name"] == "Healthy Keto")
//          .toString());

//      setState(() {
//        widget.ketoMeals = healthyKeto;
//      });
    });
  }

  _handleMenuSelect(String menu) {
    print('menu select ' + menu);
    setState(() {
      widget.selectedMenu = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff4f4f5),
        resizeToAvoidBottomPadding: false,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductsMenu(),
            Expanded(
              child: Column(
                children: <Widget>[
                  SignatureMenu(
                    onMenuSelect: (String menu) => this._handleMenuSelect(menu),
                    activeMenu:
                        widget.selectedMenu ?? signatureMenu['balanced'],
                  ),
                  // bottom view
                  Expanded(
                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: Flexible(
                            child: CustomScrollView(
                              slivers: <Widget>[
                                SliverPadding(
                                  padding: EdgeInsets.all(20.0),
                                  sliver: SliverGrid(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 30.0,
                                      crossAxisSpacing: 20.0,
                                      childAspectRatio: 1.1,
                                    ),
                                    delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                      return new ItemDetailCard(
                                        item: signatureKeto[index],
                                      );
                                    }, childCount: signatureKeto.length),

//                                delegate: SliverChildListDelegate([
//                                  ItemDetailCard(),
//                                  ItemDetailCard(),
//                                  ItemDetailCard(),
//                                  ItemDetailCard(),
//                                ]),
                                  ),
                                ),
                              ],
                            ),
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

class CategoryMenuButton extends StatelessWidget {
  CategoryMenuButton({
    this.svgIcon,
    this.label,
    this.isActive = false,
    this.onMenuTap,
  });

  final Widget svgIcon;
  final String label;
  final bool isActive;
  final Function onMenuTap;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        this.onMenuTap();
      },
      child: GestureDetector(
        child: Container(
          width: 140.0,
          height: 140.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: isActive ? Color(0xFFd35127) : Color(0xFFFFFFFF),
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
                  color: isActive ? Colors.white : Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignatureMenu extends StatefulWidget {
  SignatureMenu({this.activeMenu = 'keto', this.onMenuSelect});
  String activeMenu;
  final Function onMenuSelect;

  @override
  _SignatureMenuState createState() => _SignatureMenuState();
}

class _SignatureMenuState extends State<SignatureMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // TODO: for ListView params
        // scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryMenuButton(
            onMenuTap: () {
              widget.onMenuSelect(signatureMenu['keto']);
              setState(() {
                widget.activeMenu = signatureMenu['keto'];
              });
            },
            svgIcon: SvgKeto(isActive: widget.activeMenu == 'keto'),
            label: 'Healthy Keto',
            isActive: widget.activeMenu == signatureMenu['keto'],
          ),
          CategoryMenuButton(
            onMenuTap: () {
              widget.onMenuSelect(signatureMenu['vegan']);
              setState(() {
                widget.activeMenu = signatureMenu['vegan'];
              });
            },
            svgIcon:
                SvgVegan(isActive: widget.activeMenu == signatureMenu['vegan']),
            label: 'Healthy Vegan',
            isActive: widget.activeMenu == signatureMenu['vegan'],
          ),
          CategoryMenuButton(
            onMenuTap: () {
              widget.onMenuSelect(signatureMenu['balanced']);
              setState(() {
                widget.activeMenu = signatureMenu['balanced'];
              });
            },
            svgIcon: SvgBalanced(
              isActive: widget.activeMenu == signatureMenu['balanced'],
            ),
            label: 'Balanced',
            isActive: widget.activeMenu == signatureMenu['balanced'],
          ),
          CategoryMenuButton(
            onMenuTap: () {
              widget.onMenuSelect(signatureMenu['detox']);
              setState(() {
                widget.activeMenu = signatureMenu['detox'];
              });
            },
            svgIcon:
                SvgDetox(isActive: widget.activeMenu == signatureMenu['detox']),
            label: 'Detox Salads',
            isActive: widget.activeMenu == signatureMenu['detox'],
          ),
          CategoryMenuButton(
            onMenuTap: () {
              widget.onMenuSelect(signatureMenu['pescatarian']);
              setState(() {
                widget.activeMenu = signatureMenu['pescatarian'];
              });
            },
            svgIcon: SvgPescatarian(
                isActive: widget.activeMenu == signatureMenu['pescatarian']),
            label: 'Pescetarian',
            isActive: widget.activeMenu == signatureMenu['pescatarian'],
          ),
        ],
      ),
    );
  }
}

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
