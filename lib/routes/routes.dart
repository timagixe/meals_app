import 'package:flutter/material.dart';

import '../models/filters.dart';
import '../models/recipe.dart';
import '../screens/filters.dart';
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

Map<String, WidgetBuilder> getAppRoutes({
  @required List<Recipe> availableRecipes,
  @required Filters filters,
  @required Function(Filters) saveFilters,
  @required Function(String) updateFavoriteRecipes,
  @required Function(String) isRecipeFavorite,
  @required List<Recipe> favoriteRecipes,
}) {
  return {
    AppRoutes.ROOT: (context) => TabsScreen(
          updateFavoriteRecipes: updateFavoriteRecipes,
          favoriteRecipes: favoriteRecipes,
        ),
    AppRoutes.CATEGORY_RECIPES: (context) => CategoryRecipesScreen(
          availableRecipes: availableRecipes,
        ),
    AppRoutes.RECIPE_DETAILS: (context) => RecipeDetailsScreen(
          updateFavoriteRecipe: updateFavoriteRecipes,
          isRecipeFavorite: isRecipeFavorite,
        ),
    AppRoutes.FILTERS: (context) => FiltersScreen(
          filters: filters,
          saveFilters: saveFilters,
        ),
  };
}
