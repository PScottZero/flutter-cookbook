import 'dart:convert';

import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../model/app_model.dart';
import '../model/recipe.dart';
import '../views/recipe_view.dart';
import 'rounded_container.dart';

class SubRecipe extends StatelessWidget {
  final String recipeId;
  final AppModel model;

  Recipe get recipe => model.recipes.where((rec) => recipeId == rec.id).first;

  const SubRecipe({
    Key? key,
    required this.recipeId,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => recipeId != ''
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeView(recipe: recipe),
              ),
            )
          : null,
      child: RoundedContainer(
        padding: false,
        child: Row(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: recipe.images.isNotEmpty
                          ? Image.memory(
                              base64Decode(recipe.images[0]),
                            ).image
                          : Image.asset('assets/images/no-image.png').image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(ViewConstants.smallPadding),
                child: Text(
                  recipe.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: ViewConstants.fontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
