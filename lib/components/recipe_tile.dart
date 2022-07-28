import 'dart:convert';

import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../model/recipe.dart';
import '../views/recipe_view.dart';

class RecipeTile extends StatelessWidget {
  final Recipe recipe;
  final Color primaryColor;

  const RecipeTile({
    Key? key,
    required this.recipe,
    required this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeView(recipe: recipe),
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ViewConstants.largeBorderRadius),
          image: DecorationImage(
            image: recipe.images.isNotEmpty
                ? Image.memory(base64Decode(recipe.images[0])).image
                : const AssetImage('assets/images/no-image.png'),
            fit: BoxFit.cover,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: ViewConstants.imageTextMaxHeight,
            minHeight: 0,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                ViewConstants.smallBorderRadius,
              ),
              color: ViewConstants.imageTextBackgroundColor,
            ),
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(
              ViewConstants.mediumPadding,
              ViewConstants.smallPadding,
              ViewConstants.mediumPadding,
              ViewConstants.smallPadding,
            ),
            margin: const EdgeInsets.all(ViewConstants.mediumPadding),
            child: Text(
              recipe.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: ViewConstants.fontSize,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
