import 'dart:convert';

import 'package:cookbook/views/recipe_view.dart';
import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../model/recipe.dart';

class RecipeTile extends StatelessWidget {
  final Recipe recipe;

  const RecipeTile(this.recipe, {Key? key}) : super(key: key);

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
          boxShadow: const [
            BoxShadow(
              color: Color(0x77000000),
              spreadRadius: 0,
              blurRadius: 8,
            ),
          ],
          image: DecorationImage(
            image: recipe.images.isNotEmpty
                ? Image.memory(base64Decode(recipe.images[0])).image
                : const AssetImage('assets/no-image.png'),
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
