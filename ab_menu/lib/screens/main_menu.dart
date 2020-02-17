import 'dart:async' show Future;
import 'dart:convert';

import 'package:ab_menu/components/drinks_menu.dart';
import 'package:ab_menu/components/products_menu.dart';
import 'package:ab_menu/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

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
  MenuScreen({
    this.selectedMenu,
    this.selectedProductFromMainScreen,
  });

  final selectedProductFromMainScreen;
  var selectedProduct;
  var selectedMenu = SignatureMeals.keto;

  // Grid source
  List activeProducts = [];
//  List ketoMeals;

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    loadProducts().then((List<dynamic> products) {
//      var _signatureMeals =
//          products.where((product) => product["name"] == "Signature Meals");
//    });
    widget.activeProducts = signatureMealsProducts["keto"];
  }

  _handleProductSelect(dynamic product) {
    print("${product} selected");
    setState(() {
      widget.selectedProduct = product;
    });
  }

  _handleMenuSelect(dynamic menu) {
    setState(() {
      widget.selectedMenu = menu;
      widget.activeProducts =
          signatureMealsProducts[menu.toString().split('.')[1]] ??
              signatureMealsProducts["keto"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Row(
//          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductsMenu(
              onMenuSelect: (Products product) =>
                  this._handleProductSelect(product),
            ),
            Expanded(
              child: Container(
                color: Color(0xffD4D8DB),
                child: Column(
                  children: <Widget>[
                    DrinksMenu(
                      onMenuSelect: (SignatureMeals menu) =>
                          this._handleMenuSelect(menu),
                      activeMenu: widget.selectedMenu ?? SignatureMeals.keto,
                    ),
                    // bottom view
                    Expanded(
                      child: Column(
                        children: <Widget>[
//                          ProductGridList(
//                            source: widget.activeProducts,
//                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
