import 'package:ab_menu/data/cakes.dart';
import 'package:ab_menu/data/cold-brew.dart';
import 'package:ab_menu/data/lemon-aid.dart';
import 'package:ab_menu/data/milk-tea.dart';
import 'package:ab_menu/data/products.dart';
import 'package:ab_menu/data/protein-chips.dart';

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
  spreads,
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

Map ProductList = {
  "signature": {
    "keto": healthyKeto,
    "vegan": healthyVegan,
    "balanced": healthyBalanced,
    "detox": healthyDetox,
    "pescatarian": healthyPescatarian,
  },
  "drinks": {
    "cold_brew": coldBrew,
    "milk_tea": milkTea,
    "lemon_aid": lemonAid,
  },
  "treats": {
    "cakes": cakes,
    "milk_tea": milkTea,
    "protein_chips": proteinChips,
  },
  "frozen": {
    "cakes": cakes,
    "milk_tea": milkTea,
    "protein_chips": proteinChips,
  },
};
