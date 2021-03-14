import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/category_recepies.dart';

class AppRoutes {
  static const String ROOT = '/';
  static const String CATEGORY_RECIPIES = '/category-recipies';
}

const String kAppInitialRoute = AppRoutes.ROOT;

Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.ROOT: (context) => CategoriesScreen(),
  AppRoutes.CATEGORY_RECIPIES: (context) => CategoryRecipiesScreen(),
};
