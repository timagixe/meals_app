import 'package:flutter/material.dart';
import 'package:meals_app/models/recipe.dart';

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetail({@required this.recipe}) : assert(recipe != null);

  Widget buildSectionTitle({BuildContext context, String title}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer({BuildContext context, Widget child}) {
    return Container(
      width: 300,
      height: 150,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(
            recipe.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          buildSectionTitle(
            context: context,
            title: 'Ingredients',
          ),
          buildContainer(
            context: context,
            child: ListView.builder(
              itemCount: recipe.ingredients.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(recipe.ingredients[index]),
                  ),
                );
              },
            ),
          ),
          buildSectionTitle(
            context: context,
            title: 'Steps',
          ),
          buildContainer(
              context: context,
              child: ListView.builder(
                  itemCount: recipe.steps.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(recipe.steps[index]),
                        ),
                        if (index != recipe.steps.length - 1) Divider()
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
