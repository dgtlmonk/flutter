import 'package:uuid/uuid.dart';

const path = "images/products/milk-tea/";
final lemonAid = [
  {
    "id": new Uuid().v4(),
    "name": "LemonAID (with Lemongrass)",
    "price": 120,
    "macro":
        "Sugar-free, Keto/Vegan/Paleo friendly.\nAlkaline water, Lemon, Lemongrass, Stevia",
//    "src": path + "taro.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "LemonAID (with Spirulina)",
    "price": 120,
    "macro":
        "Sugar-free, Keto/Vegan/Paleo friendly.\nAlkaline water, Lemon, Spirulina, Stevia",
//    "src": path + "original.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "LemonAID (with Activated Charcoal)",
    "price": 120,
    "macro":
        "Sugar-free, Keto/Vegan/Paleo friendly.\nAlkaline water, Lemon, Activated Charcoal, Stevia",
//    "src": path + "matcha.jpg"
  },
];
