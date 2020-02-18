// TODO: for iteration
import 'package:uuid/uuid.dart';

const path = "images/products/cakes/";
final cakes = [
  {
    "id": new Uuid().v4(),
    "name": "Keto/Vegan Cheesecake",
    "price": 400,
    "macro": "",
  },
  {
    "id": new Uuid().v4(),
    "name": "Vegan Truffle Cake",
    "price": 400,
    "macro": "No sugar added",
  },
  {
    "id": new Uuid().v4(),
    "name": "Vegan Snickers",
    "price": 400,
    "macro": "No sugar added"
  },
  {
    "id": new Uuid().v4(),
    "name": "Keto/Vegan Tiramisu",
    "price": 400,
    "macro": "",
  },
];
