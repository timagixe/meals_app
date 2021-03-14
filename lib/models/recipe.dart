import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Recipe {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Recipe({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  })  : assert(id != null),
        assert(categories != null || categories.length != 0),
        assert(title != null),
        assert(imageUrl != null),
        assert(ingredients != null || ingredients.length != 0),
        assert(steps != null || steps.length != 0),
        assert(duration != null),
        assert(complexity != null),
        assert(affordability != null),
        assert(isGlutenFree != null),
        assert(isLactoseFree != null),
        assert(isVegan != null),
        assert(isVegetarian != null);
}
