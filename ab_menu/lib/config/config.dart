import 'package:ab_menu/data/products.dart';

final version = "1.0.1";
final kBordeRadius = 15.0;

enum signatureMeals { keto, vegan, detox, balanced, pescatarian }

Map signatureMealsProducts = {
  'keto': healthyKeto,
  'vegan': healthyVegan,
  'balanced': healthyBalanced,
  'detox': healthyDetox,
  'pescatarian': healthyPescatarian,
};
