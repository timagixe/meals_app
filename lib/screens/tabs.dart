import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './categories.dart';
import './favorites.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _screens = [
    {
      'title': 'Categories',
      'screen': CategoriesScreen(),
    },
    {
      'title': 'Favorites',
      'screen': FavoritesScreen(),
    }
  ];
  int _selectedScreenId = 0;

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
