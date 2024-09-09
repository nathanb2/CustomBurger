import 'dart:collection';

import 'package:your_lunch/model/Element.dart';
import 'package:your_lunch/model/Ingredients.dart';
import 'package:your_lunch/model/Steack.dart';

// enum Weight {
//   w150(150),
//   w200(200),
//   w300(300);
//
//   final int value;
//
//   const Weight(this.value);
// }
//
// enum CookLevel { low, medium, high, hih, dcd , de ,dede,  deded ,deede }
// enum Topping { concomber, egg, tomatos, egg1, tomatos1, egg2, tomatos2, egg3, tomatos3, egg4, tomatos4 }
// enum Sauce { ketchup, mayonaise, mustard, mayonaise1, mustard2, mayonaise3, mustard4 }

class Burger {
  int id;
  String name;
  Steack? steack;
  Element? cookLevel;
  List<Element>? toppings = [];
  List<Element>? sauces = [];
  bool? sauceInside;
  String? image;

  // Constructor
  Burger({
    required this.id,
    required this.name,
  });
}
