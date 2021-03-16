import 'package:flutter/material.dart';
import 'package:meals_app/widgets/recipe_details.dart';

import '../mocks/recipes.dart';
import '../models/recipe.dart';

class RecipeDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context).settings.arguments;

    final String id = arguments['id'];
    final Recipe recipe = RECIPES.firstWhere((recipe) => recipe.id == id);

    return Scaffold(
        appBar: AppBar(
          title: Text(id),
        ),
        body: RecipeDetails(
          recipe: recipe,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            Navigator.of(context).pop(id);
          },
        ));
  }
}
