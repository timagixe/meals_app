import 'package:flutter/material.dart';

class RecipeItemDetail extends StatelessWidget {
  final IconData icon;
  final String text;

  const RecipeItemDetail({
    @required this.text,
    @required this.icon,
  })  : assert(text != null),
        assert(icon != null);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(icon),
          ),
          Text(text),
        ],
      ),
    );
  }
}
