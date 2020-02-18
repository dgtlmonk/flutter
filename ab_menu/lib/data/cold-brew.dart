import 'package:uuid/uuid.dart';

const path = "images/products/milk-tea/";
final coldBrew = [
  {
    "id": new Uuid().v4(),
    "name": "Vanilla Hazelnul",
    "price": 130,
    "macro":
        "A blend made from black cold coffee with lightly toasted hazelnut and vanilla to give full bodied rich flavor yet subtle and complex taste.",
//    "src": path + "taro.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Mexican",
    "price": 130,
    "macro":
        "Made from pure black cold brew coffee with ghana cacao and ceylon cinnamon.",
//    "src": path + "original.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Black",
    "price": 220,
    "macro":
        "Not your ordinary classic black. A smooth and flavorful taste with notes of caramel and chocolate.",
//    "src": path + "matcha.jpg"
  },
];
