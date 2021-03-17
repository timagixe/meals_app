import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './categories.dart';
import './favorites.dart';
import '../models/recipe.dart';

class TabsScreen extends StatefulWidget {
  final Function(String) updateFavoriteRecipes;
  final List<Recipe> favoriteRecipes;

  TabsScreen({
    @required this.updateFavoriteRecipes,
    @required this.favoriteRecipes,
  })  : assert(updateFavoriteRecipes != null),
        assert(favoriteRecipes != null);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _screens;
  int _selectedScreenId = 0;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Categories',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Favorites',
        'screen': FavoritesScreen(
          updateFavoriteRecipes: widget.updateFavoriteRecipes,
          favoriteRecipes: widget.favoriteRecipes,
        ),
      }
    ];
  }

  void _onTabBarItemTap(int screenId) {
    setState(() {
      _selectedScreenId = screenId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenId]['title']),
      ),
      body: _screens[_selectedScreenId]['screen'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabBarItemTap,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenId,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
