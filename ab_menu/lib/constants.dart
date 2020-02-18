import 'package:ab_menu/data/products.dart';

final kBordeRadius = 15.0;

enum SignatureMeals {
  keto,
  vegan,
  detox,
  balanced,
  pescatarian,
}
enum Drinks {
  cold_brew,
  milk_tea,
  lemon_aid,
}
enum Treats {
  cakes,
  milk_tea,
  protein_chips,
}

enum Products {
  signature,
  drinks,
  treats,
  frozen,
  spread,
  addon,
  detox_soup,
}

Map signatureMealsProducts = {
  'keto': healthyKeto,
  'vegan': healthyVegan,
  'balanced': healthyBalanced,
  'detox': healthyDetox,
  'pescatarian': healthyPescatarian,
};

//child: ListView.builder(
//scrollDirection: Axis.horizontal,
//itemCount: treatsProducts.length,
//itemBuilder: (BuildContext context, int index) {
//return  ProductMenuButton(
//onMenuTap: () {
//widget.onMenuSelect(SignatureMeals.keto);
//setState(() {
//widget.activeMenu = SignatureMeals.keto;
//});
//},
//svgIcon: SvgCake(
//isActive: widget.activeMenu == SignatureMeals.keto,
//),
//label: 'Cakes',
//isActive: widget.activeMenu == SignatureMeals.keto,
//);
//},
//),
