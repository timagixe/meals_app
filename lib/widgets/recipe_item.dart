import 'package:flutter/material.dart';
import 'package:meals_app/routes/routes.dart';

import './recipe_item_detail.dart';
import './recipe_item_image.dart';
import '../models/recipe.dart';

class RecipeItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;

  const RecipeItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
  })  : assert(id != null),
        assert(title != null),
        assert(imageUrl != null),
        assert(duration != null),
        assert(affordability != null),
        assert(complexity != null);

  void onRecipeItemTap(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.RECIPE_DETAILS, arguments: {
      'id': id,
    });
  }

  get getComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  get getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () => onRecipeItemTap(context),
          child: Column(
            children: [
              RecipeItemImage(imageUrl: imageUrl),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RecipeItemDetail(
                      icon: Icons.schedule_outlined,
                      text: '$duration min',
                    ),
                    RecipeItemDetail(
                      icon: Icons.work_outline_outlined,
                      text: getComplexity,
                    ),
                    RecipeItemDetail(
                      icon: Icons.attach_money_outlined,
                      text: getAffordability,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
