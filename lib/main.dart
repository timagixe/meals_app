import 'package:flutter/material.dart';

import './mocks/recipes.dart';
import './models/filters.dart';
import './models/recipe.dart';
import './routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Recipe> _favoriteRecipes = [];
  List<Recipe> _availableRecipes = RECIPES;
  Filters _filters = Filters(
    gluten: false,
    lactose: false,
    vegetarian: false,
    vegan: false,
  );

  void _updateFilters(Filters newFilters) {
    setState(() {
      _filters = newFilters;

      _availableRecipes = _availableRecipes.where((recipe) {
        if (_filters.gluten && !recipe.isGlutenFree) {
          return false;
        }
        if (_filters.lactose && !recipe.isLactoseFree) {
          return false;
        }
        if (_filters.vegetarian && !recipe.isVegetarian) {
          return false;
        }
        if (_filters.vegan && !recipe.isVegan) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _updateFavoriteRecipes(String id) {
    final favoriteRecipeId =
        _favoriteRecipes.indexWhere((element) => element.id == id);

    if (favoriteRecipeId >= 0) {
      setState(() {
        _favoriteRecipes.removeAt(favoriteRecipeId);
      });
    } else {
      setState(() {
        _favoriteRecipes.add(RECIPES.firstWhere((element) => element.id == id));
      });
    }
  }

  bool _isRecipeFavorite(String id) {
    return _favoriteRecipes.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      routes: getAppRoutes(
        availableRecipes: _availableRecipes,
        filters: _filters,
        saveFilters: _updateFilters,
        updateFavoriteRecipes: _updateFavoriteRecipes,
        isRecipeFavorite: _isRecipeFavorite,
        favoriteRecipes: _favoriteRecipes,
      ),
    );
  }
}
