import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem({
    @required this.title,
    @required this.color,
  })  : assert(title != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
