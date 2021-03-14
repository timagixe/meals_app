import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../mocks/categories.dart';

const double _kmaxCrossAxisExtent = 200.0;
const double _kchildAspectRatio = 3 / 2;
const double _kcrossAxisSpacing = 20.0;
const double _kmainAxisSpacing = 20.0;

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CategoryItem> categoryItems = CATEGORIES
        .map((data) => CategoryItem(
              id: data.id,
              title: data.title,
              color: data.color,
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: categoryItems,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _kmaxCrossAxisExtent,
          childAspectRatio: _kchildAspectRatio,
          crossAxisSpacing: _kcrossAxisSpacing,
          mainAxisSpacing: _kmainAxisSpacing,
        ),
      ),
    );
  }
}
