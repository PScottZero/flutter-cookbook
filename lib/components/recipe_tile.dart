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
          boxShadow: [
            BoxShadow(
              color: primaryColor,
              spreadRadius: 0,
              blurRadius: 8,
            ),
          ],
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
            maxHeight: 100,
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
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            margin: const EdgeInsets.all(10),
            child: Text(
              recipe.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: ViewConstants.smallFont,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
