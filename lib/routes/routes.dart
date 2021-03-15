import 'package:flutter/material.dart';
import 'package:meals_app/screens/recipe_details.dart';

import '../screens/categories.dart';
import '../screens/category_recipes.dart';

class AppRoutes {
  static const String ROOT = '/';
  static const String CATEGORY_RECIPES = '/category-recipes';
  static const String RECIPE_DETAILS = '/recipe-details';
}

const String kAppInitialRoute = AppRoutes.ROOT;

Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.ROOT: (context) => CategoriesScreen(),
  AppRoutes.CATEGORY_RECIPES: (context) => CategoryRecipesScreen(),
  AppRoutes.RECIPE_DETAILS: (context) => RecipeDetailsScreen(),
};
