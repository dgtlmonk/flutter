// TODO: for iteration
import 'package:uuid/uuid.dart';

const path = "images/products/chips/";
final proteinChips = [
  {
    "id": new Uuid().v4(),
    "name": "Hickory BBQ",
    "price": 110,
    "macro": "F 3g C 4g P 30g\nSodium 110g, Sugar 1g",
    "src": path + "hickory-bbq.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Cheddar Sour Cream",
    "price": 110,
    "macro": "F 3g C 4g P 30g\nSodium 110g, Sugar 1g",
    "src": path + "cheddar-sour.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Premium Cheese",
    "price": 110,
    "macro": "F 3g C 4g P 30g\nSodium 110g, Sugar 1g",
    "src": path + "cheese.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Wasabi",
    "price": 110,
    "macro": "F 3g C 4g P 30g\nSodium 110g, Sugar 1g",
    "src": path + "wasabi.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Cheezy Pizza",
    "price": 110,
    "macro": "F 3g C 4g P 30g\nSodium 110g, Sugar 1g",
    "src": path + "cheesy-pizza.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Moringa Sour Cream",
    "price": 110,
    "macro": "F 3g C 4g P 30g\nSodium 110g, Sugar 1g",
    "src": path + "moringa.jpg"
  },
];
