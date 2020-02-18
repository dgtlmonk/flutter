import 'package:ab_menu/data/cakes.dart';
import 'package:ab_menu/data/milk-tea.dart';
import 'package:ab_menu/data/protein-chips.dart';
import 'package:ab_menu/icons/svg.dart';

Map treatsUIConfig = {
  'cakes': {
    "label": 'Cakes',
    "data": cakes,
    "icon": SvgCake,
  },
  'milk_tea': {
    "label": 'Milk Tea',
    "data": milkTea,
    "icon": SvgMilkTea,
  },
  'protein_chips': {
    "label": 'Protein Chips',
    "data": proteinChips,
    "icon": SvgProteinChips,
  },
};
