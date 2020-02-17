import 'package:ab_menu/data/products.dart';

final kBordeRadius = 15.0;

enum SignatureMeals {
  keto,
  vegan,
  detox,
  balanced,
  pescatarian,
}
enum Drinks { cold_brew, milk_tea, lemon_aid }
enum Products { signature, drinks, treats, frozen, spread, addon, detox_soup }

Map signatureMealsProducts = {
  'keto': healthyKeto,
  'vegan': healthyVegan,
  'balanced': healthyBalanced,
  'detox': healthyDetox,
  'pescatarian': healthyPescatarian,
};
