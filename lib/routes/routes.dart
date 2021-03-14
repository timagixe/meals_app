import 'package:flutter/material.dart';

import '../screens/categories.dart';
import '../screens/category_recipes.dart';

class AppRoutes {
  static const String ROOT = '/';
  static const String CATEGORY_RECIPES = '/category-recipes';
}

const String kAppInitialRoute = AppRoutes.ROOT;

Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.ROOT: (context) => CategoriesScreen(),
  AppRoutes.CATEGORY_RECIPES: (context) => CategoryRecipesScreen(),
};
