import 'package:uuid/uuid.dart';

const path = "images/products/lemon-aid/";
final lemonAid = [
  {
    "id": new Uuid().v4(),
    "name": "LemonAID (with Lemongrass)",
    "price": 120,
    "macro":
        "Sugar-free, Keto/Vegan/Paleo friendly.\nAlkaline water, Lemon, Lemongrass, Stevia",
    "src": path + "lemon-grass.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "LemonAID (with Spirulina)",
    "price": 120,
    "macro":
        "Sugar-free, Keto/Vegan/Paleo friendly.\nAlkaline water, Lemon, Spirulina, Stevia",
    "src": path + "spirulina.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "LemonAID (with Activated Charcoal)",
    "price": 120,
    "macro":
        "Sugar-free, Keto/Vegan/Paleo friendly.\nAlkaline water, Lemon, Activated Charcoal, Stevia",
    "src": path + "charcoal.jpg"
  },
];
