import 'package:ab_menu/constants.dart';
import 'package:ab_menu/data/cakes.dart';
import 'package:ab_menu/data/cold-brew.dart';
import 'package:ab_menu/data/keto.dart';
import 'package:ab_menu/data/lemon-aid.dart';
import 'package:ab_menu/data/milk-tea.dart';
import 'package:ab_menu/data/products.dart';
import 'package:ab_menu/data/protein-chips.dart';
import 'package:ab_menu/data/vegan.dart';
import 'package:ab_menu/icons/svg.dart';

Map signatureUIConfig = {
  'keto': {
    "label": 'Healthy Keto',
    "data": signatureKeto,
    "icon": SvgKeto,
    "key": 'keto',
  },
  'vegan': {
    "label": 'Healthy Vegan',
    "data": signatureVegan,
    "icon": SvgVegan,
    "key": "vegan",
  },
  'balanced': {
    "label": 'Balanced',
    "data": healthyBalanced,
    "icon": SvgBalanced,
    "key": "balanced"
  },
  'detox': {
    "label": 'Detox Salads',
    "data": healthyDetox,
    "icon": SvgDetox,
    "key": "detox"
  },
  'perscatarian': {
    "label": 'Pescetarian',
    "data": healthyPescatarian,
    "icon": SvgPescatarian,
    "key": "pescatarian"
  },
};

Map treatsUIConfig = {
  'cakes': {
    "label": 'Cakes',
    "data": cakes,
    "icon": SvgCake,
    "key": 'cakes',
  },
  'milk_tea': {
    "label": 'Milk Tea',
    "data": milkTea,
    "icon": SvgMilkTea,
    "key": "milk_tea",
  },
  'protein_chips': {
    "label": 'Protein Chips',
    "data": proteinChips,
    "icon": SvgProteinChips,
    "key": "protein_chips"
  },
};

Map drinksUIConfig = {
  'cold_brew': {
    "label": 'Cold Brew',
    "data": coldBrew,
    "icon": SvgColdBew,
    "key": 'cold_brew',
  },
  'milk_tea': {
    "label": 'Milk Tea',
    "data": milkTea,
    "icon": SvgMilkTea,
    "key": "milk_tea",
  },
  'lemon_aid': {
    "label": 'Lemon AID',
    "data": lemonAid,
    "icon": SvgProteinChips,
    "key": "lemon_aid"
  },
};

Map splashScreenUiConfig = {
  'signature': {
    "key": Products.signature,
    "src": "cover-0.jpg",
  },
  'treats': {
    "key": Products.treats,
    "src": "cover-1.jpg",
  },
  'frozen': {
    "key": Products.frozen,
    "src": "cover-2.jpg",
  },
  'spreads': {
    "key": Products.spreads,
    "src": "cover-3.jpg",
  },
};
