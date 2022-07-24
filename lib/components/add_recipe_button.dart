import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../model/app_model.dart';
import '../model/recipe.dart';
import '../views/edit_recipe_view.dart';

class AddRecipeButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final AppModel model;

  const AddRecipeButton({
    Key? key,
    required this.backgroundColor,
    required this.textColor,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: backgroundColor,
      label: Text(
        'Add Recipe',
        style: TextStyle(
          fontSize: ViewConstants.smallFont,
          color: textColor,
        ),
      ),
      icon: Icon(
        Icons.add,
        color: textColor,
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            model.selectedRecipe = Recipe.empty();
            return const EditRecipeView();
          },
        ),
      ),
    );
  }
}
