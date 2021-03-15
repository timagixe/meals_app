import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters.dart';

import '../screens/recipe_details.dart';
import '../screens/category_recipes.dart';
import '../screens/tabs.dart';

class AppRoutes {
  static const String ROOT = '/';
  static const String CATEGORY_RECIPES = '/category-recipes';
  static const String RECIPE_DETAILS = '/recipe-details';
  static const String FILTERS = '/filters';
}

const String kAppInitialRoute = AppRoutes.ROOT;

Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.ROOT: (context) => TabsScreen(),
  AppRoutes.CATEGORY_RECIPES: (context) => CategoryRecipesScreen(),
  AppRoutes.RECIPE_DETAILS: (context) => RecipeDetailsScreen(),
  AppRoutes.FILTERS: (context) => FiltersScreen(),
};
