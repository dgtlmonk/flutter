// TODO: for iteration
import 'package:uuid/uuid.dart';

const path = "images/products/vegan/";
final peanutButter = [
  {
    "id": new Uuid().v4(),
    "name": "Original (375g)",
    "price": 250,
    "macro":
        "Roasted organic peanuts, Virgin Coconut oil, Coconut sugar & Himalayan pink salt.\nF 8g • P8g ",
  },
  {
    "id": new Uuid().v4(),
    "name": "Keto (375g)",
    "price": 395,
    "macro":
        "Roasted organic peanuts, organic avocado oil, mtc oil, erythritol, & Himalayan pink salt. \nF 20g • P8g",
  },
  {
    "id": new Uuid().v4(),
    "name": "Unsweetened (375g)",
    "price": 220,
    "macro":
        "Roasted Organic peanuts, MTC oil, Avocado oil, Himalayan Pink salt. \nF 8g • P8g ",
  },
];
