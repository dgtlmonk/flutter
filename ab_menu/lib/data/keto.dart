// TODO: for iteration
import 'package:uuid/uuid.dart';

const path = "images/products/keto/";
final signatureKeto = [
  {
    "id": new Uuid().v4(),
    "name": "Wagyu kare-kare with cauliflower shrimp rice",
    "price": 450,
    "macro": "411kcal (F 35g C 0g P 24g)\nSodium - 225mg",
  },
  {
    "id": new Uuid().v4(),
    "name": "Moroccan spiced chicken with cauliflower mashed",
    "price": 350,
    "macro": "373kcal (F 29g C 0g P 28g)\nSodium - 380mg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Japchae with beef bulgogi",
    "price": 400,
    "macro": "290kcal (F 22g C 0g P 23g)\nSodium - 321mg",
    "src": path + "japchae-beef-bulgogi.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Seafood Palabok",
    "price": 380,
    "macro": "391kcal (F 27g C 0g P 35g)\nSodium - 285mg",
    "src": path + "seafood-palabok.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Pad thai with shrimps ",
    "price": 350,
    "macro": "213kcal (F 20g C 0g P 33g)\nSodium - 238mg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Beef sukiyaki",
    "price": 350,
    "macro": "425kcal (F 33g C 0g P 32g)\nSodium- 382mg",
    "src": path + "beef-sukiyaki.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Wagyu hamburger",
    "price": 450,
    "macro": "424kcal (F 36 C 0g P 25g)\nSodium- 346mg",
    "src": path + "wagyu-hamburger.jpg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Steak fajitas",
    "price": 400,
    "macro": "344kcal (F 24g C 0g P 32g)\nSodium- 323mg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Beef rendang with keto naan bread",
    "price": 450,
    "macro": "457kcal (F 33g C 0g P 40g)\nSodium- 297mg"
  },
  {
    "id": new Uuid().v4(),
    "name": "Seafood putanesca",
    "price": 350,
    "macro": "413kcal (F 29g C <1g P 37g)\nSodium - 237mg"
  }
];
