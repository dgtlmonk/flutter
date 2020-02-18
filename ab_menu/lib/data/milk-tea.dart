import 'package:uuid/uuid.dart';

const path = "images/products/milk-tea/";
final milkTea = [
  {
    "id": new Uuid().v4(),
    "name": "Sugar-free Taro Milk Tea",
    "price": 220,
    "macro": "132.8kcal(F 12.7g C 3g P 1.7g)\nSugar free",
    "src": path + "taro.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Sugar-free Original Milk Tea",
    "price": 220,
    "macro": "132.8kcal(F 12.7g C 3g P 1.7g)\nSugar free",
    "src": path + "original.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Sugar-free Matcha Milk Tea",
    "price": 220,
    "macro": "132.8kcal(F 12.7g C 3g P 1.7g)\nSugar free",
    "src": path + "matcha.jpg"
  },
];
