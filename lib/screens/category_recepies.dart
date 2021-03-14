import 'package:flutter/material.dart';

class CategoryRecipiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context).settings.arguments;

    final String id = arguments['id'];
    final String title = arguments['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('The Recipies Screen\n$id'),
      ),
    );
  }
}
