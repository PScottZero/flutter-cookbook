import 'dart:convert';

import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../model/recipe.dart';
import '../views/recipe_view.dart';
import 'rounded_container.dart';

class SubRecipe extends StatelessWidget {
  final Recipe? recipe;

  const SubRecipe({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => recipe != null
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeView(recipe: recipe!),
              ),
            )
          : null,
      child: RoundedContainer(
        padding: false,
        child: Row(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: ViewConstants.imageAspectRatio,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: recipe?.images.isNotEmpty ?? false
                          ? Image.memory(
                              base64Decode(recipe!.images[0]),
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
                padding: const EdgeInsets.all(ViewConstants.mediumPadding),
                child: Text(
                  recipe?.name ?? '',
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
