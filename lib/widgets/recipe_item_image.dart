import 'package:flutter/material.dart';

class RecipeItemImage extends StatelessWidget {
  final String imageUrl;
  final String title;

  const RecipeItemImage({
    @required this.imageUrl,
    @required this.title,
  })  : assert(imageUrl != null),
        assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
          ),
          child: Stack(
            children: [
              Image.network(
                imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  width: 250,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
