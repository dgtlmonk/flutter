import 'package:ab_menu/data/add-on.dart';
import 'package:ab_menu/data/balanced.dart';
import 'package:ab_menu/data/cakes.dart';
import 'package:ab_menu/data/cold-brew.dart';
import 'package:ab_menu/data/detox-soup.dart';
import 'package:ab_menu/data/detox.dart';
import 'package:ab_menu/data/frozen.dart';
import 'package:ab_menu/data/keto.dart';
import 'package:ab_menu/data/lemon-aid.dart';
import 'package:ab_menu/data/milk-tea.dart';
import 'package:ab_menu/data/peanut-butter.dart';
import 'package:ab_menu/data/percatarian.dart';
import 'package:ab_menu/data/protein-chips.dart';
import 'package:ab_menu/data/vegan.dart';

Map signatureMealsProducts = {
  'keto': signatureKeto,
  'vegan': signatureVegan,
  'balanced': signatureBalanced,
  'detox': signatureDetox,
  'pescatarian': signaturePescatarian,
};

Map ProductList = {
  "signature": {
    "keto": signatureKeto,
    "vegan": signatureVegan,
    "balanced": signatureBalanced,
    "detox": signatureDetox,
    "pescatarian": signaturePescatarian,
  },
  "drinks": {
    "cold_brew": coldBrew,
    "milk_tea": milkTea,
    "lemon_aid": lemonAid,
  },
  "treats": {
    "cakes": cakes,
    "milk_tea": milkTea,
    "protein_chips": proteinChips,
  },
  "frozen": {
    "index": frozen,
  },
  "spreads": {
    "peanut_butter": peanutButter,
  },
  "addon": {
    "index": addOn,
  },
  "detox_soup": {
    "index": detoxSoup,
  },
};
