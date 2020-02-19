// TODO: for iteration
import 'package:uuid/uuid.dart';

const path = "images/products/cakes/";
final cakes = [
  {
    "id": new Uuid().v4(),
    "name": "Keto/Vegan Cheesecake",
    "price": 400,
    "macro": "",
    "src": path + "cheese-cake.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Vegan Truffle Cake",
    "price": 400,
    "macro": "No sugar added",
    "src": path + "truffle.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Vegan Snickers",
    "price": 400,
    "macro": "No sugar added",
    "src": path + "snickers.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Keto/Vegan Tiramisu",
    "price": 400,
    "macro": "",
    "src": path + "tiramisu.jpg"
  },
];
