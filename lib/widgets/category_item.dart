import 'package:flutter/material.dart';

import '../routes/routes.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({
    @required this.id,
    @required this.title,
    @required this.color,
  })  : assert(id != null),
        assert(title != null),
        assert(color != null);

  void onCategoryItemTap(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.CATEGORY_RECIPES, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onCategoryItemTap(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
