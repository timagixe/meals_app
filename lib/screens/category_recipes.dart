import 'package:flutter/material.dart';

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

    print(id);
    print(recipes);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Center(
              child: Text('${recipes[index].title}'),
            );
          }),
    );
  }
}
