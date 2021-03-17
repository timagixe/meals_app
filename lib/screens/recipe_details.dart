import 'package:flutter/material.dart';
import 'package:meals_app/widgets/recipe_details.dart';

import '../mocks/recipes.dart';
import '../models/recipe.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Function(String) updateFavoriteRecipe;
  final Function(String) isRecipeFavorite;

  RecipeDetailsScreen({
    @required this.updateFavoriteRecipe,
    @required this.isRecipeFavorite,
  })  : assert(updateFavoriteRecipe != null),
        assert(isRecipeFavorite != null);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context).settings.arguments;

    final String id = arguments['id'];
    final Recipe recipe = RECIPES.firstWhere((recipe) => recipe.id == id);

    return Scaffold(
        appBar: AppBar(
          title: Text(recipe.title),
        ),
        body: RecipeDetails(
          recipe: recipe,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(isRecipeFavorite(id) ? Icons.star : Icons.star_border),
          onPressed: () => updateFavoriteRecipe(id),
        ));
  }
}
