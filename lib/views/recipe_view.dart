import 'dart:convert';

import 'package:flutter/material.dart';

import '../components/custom_scaffold.dart';
import '../components/item_list.dart';
import '../model/recipe.dart';

class RecipeView extends StatelessWidget {
  final Recipe recipe;

  const RecipeView({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: recipe.name,
      body: ListView(
        children: [
          Image.memory(base64Decode(recipe.images[0])),
          ItemList(
            title: 'Ingredients',
            items: recipe.ingredients,
          ),
          ItemList(
            title: 'Instructions',
            items: recipe.instructions,
          ),
        ],
      ),
    );
  }
}
