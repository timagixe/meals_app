import 'package:flutter/material.dart';

import '../models/recipe.dart';
import '../widgets/recipe_item.dart';

class FavoritesScreen extends StatelessWidget {
  final Function(String) updateFavoriteRecipes;
  final List<Recipe> favoriteRecipes;

  FavoritesScreen({
    @required this.updateFavoriteRecipes,
    @required this.favoriteRecipes,
  })  : assert(updateFavoriteRecipes != null),
        assert(favoriteRecipes != null);

  @override
  Widget build(BuildContext context) {
    if (favoriteRecipes.isEmpty) {
      return Center(
        child: Text('You have no favorite recipes yet.'),
      );
    } else {
      return ListView.builder(
          itemCount: favoriteRecipes.length,
          itemBuilder: (context, index) {
            return RecipeItem(
              id: favoriteRecipes[index].id,
              title: favoriteRecipes[index].title,
              imageUrl: favoriteRecipes[index].imageUrl,
              duration: favoriteRecipes[index].duration,
              affordability: favoriteRecipes[index].affordability,
              complexity: favoriteRecipes[index].complexity,
            );
          });
    }
  }
}
