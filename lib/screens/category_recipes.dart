import 'package:flutter/material.dart';

import '../widgets/recipe_item.dart';
import '../mocks/recipes.dart';
import '../models/recipe.dart';

class CategoryRecipesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context).settings.arguments;

    final String id = arguments['id'];
    final String title = arguments['title'];
    final List<Recipe> recipes = RECIPES
        .where(
          (recipe) => recipe.categories.contains(id),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return RecipeItem(
                id: recipes[index].id,
                title: recipes[index].title,
                imageUrl: recipes[index].imageUrl,
                duration: recipes[index].duration,
                affordability: recipes[index].affordability,
                complexity: recipes[index].complexity);
          }),
    );
  }
}
