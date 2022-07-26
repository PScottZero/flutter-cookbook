import 'dart:convert';

import 'package:cookbook/views/recipe_view.dart';
import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../model/app_model.dart';
import '../model/recipe.dart';
import 'rounded_container.dart';

class LinkedRecipe extends StatelessWidget {
  final String recipeId;
  final AppModel model;

  Recipe get recipe => model.recipes.where((rec) => recipeId == rec.id).first;

  const LinkedRecipe({
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
            recipe.images.isNotEmpty
                ? Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Image.memory(
                              base64Decode(recipe.images[0]),
                            ).image,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.low,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
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
            )
          ],
        ),
      ),
    );
  }
}
