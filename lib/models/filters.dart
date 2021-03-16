import 'package:flutter/material.dart';

class Filters {
  final bool gluten;
  final bool vegetarian;
  final bool vegan;
  final bool lactose;

  const Filters({
    @required this.gluten,
    @required this.lactose,
    @required this.vegan,
    @required this.vegetarian,
  })  : assert(gluten != null),
        assert(lactose != null),
        assert(vegetarian != null),
        assert(vegan != null);
}
