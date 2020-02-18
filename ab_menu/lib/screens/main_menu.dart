import 'dart:async' show Future;
import 'dart:convert';

import 'package:ab_menu/components/drinks_menu.dart';
import 'package:ab_menu/components/product_grid_list.dart';
import 'package:ab_menu/components/products_menu.dart';
import 'package:ab_menu/components/signature_menu.dart';
import 'package:ab_menu/components/treats_menu.dart';
import 'package:ab_menu/config/ui/menu.dart';
import 'package:ab_menu/constants.dart';
import 'package:ab_menu/screens/splash-menu.dart';
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
    this.selectedProduct,
  });

  var selectedProduct;
  var selectedCategory = 'keto';

  // Grid source
  List activeProductLists = [];

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    print("init called " + widget.selectedProduct.toString());
//    loadProducts().then((List<dynamic> products) {
//      var _signatureMeals =
//          products.where((product) => product["name"] == "Signature Meals");
//    });
    widget.activeProductLists = signatureMealsProducts["keto"];
  }

  _handleProductSelect(Products product) {
    print('selected product ' + product.toString());
    setState(() {
      widget.selectedProduct = product;
    });
  }

  _handleCategorySelect(String category) {
    print(category.toString() + " selected ");
    setState(() {
      widget.selectedCategory = category;
      // widget.productList = widget.selectedProduct["category"]["data"]
//      widget.activeProducts =
//          signatureMealsProducts[menu.toString().split('.')[1]] ??
//          menu.toString() ?? signatureMealsProducts["keto"];
    });
  }

  _getProductMenu() {
    switch (widget.selectedProduct) {
      case Products.drinks:
        return DrinksMenu(
          onCategorySelect: (String category) =>
              this._handleCategorySelect(category),
          activeMenu: widget.selectedCategory ?? SignatureMeals.keto,
        );

      case Products.treats:
        return TreatsMenu(
          onCategorySelect: (String category) =>
              this._handleCategorySelect(category),
          activeMenu: widget.selectedCategory ?? treatsUIConfig["cakes"]["key"],
        );

      default:
        return SignatureMenu(
          onCategorySelect: (String category) =>
              this._handleCategorySelect(category),
          activeMenu: widget.selectedCategory ?? SignatureMeals.keto,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    print(args.productSelected.toString());

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
                    _getProductMenu(),
                    // bottom view
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          ProductGridList(
                            source: widget.activeProductLists,
                          ),
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
