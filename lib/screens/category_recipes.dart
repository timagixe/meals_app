import 'package:flutter/material.dart';

import '../widgets/recipe_item.dart';
import '../models/recipe.dart';

class CategoryRecipesScreen extends StatefulWidget {
  final List<Recipe> availableRecipes;

  CategoryRecipesScreen({
    @required this.availableRecipes,
  }) : assert(availableRecipes != null);
  @override
  _CategoryRecipesScreenState createState() => _CategoryRecipesScreenState();
}

class _CategoryRecipesScreenState extends State<CategoryRecipesScreen> {
  String title;
  List<Recipe> recipes;
  bool hasInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!hasInitialized) {
      final Map<String, String> arguments =
          ModalRoute.of(context).settings.arguments;

      final String id = arguments['id'];
      title = arguments['title'];
      recipes = widget.availableRecipes
          .where(
            (recipe) => recipe.categories.contains(id),
          )
          .toList();
      hasInitialized = true;
    }
  }

  void _removeRecipe(String id) {
    setState(() {
      recipes.removeWhere((recipe) => recipe.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              complexity: recipes[index].complexity,
              removeItem: _removeRecipe,
            );
          }),
    );
  }
}
