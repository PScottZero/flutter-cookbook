import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../views/edit_recipe_view.dart';

class AddRecipeButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;

  const AddRecipeButton({
    Key? key,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: backgroundColor,
      elevation: 0,
      label: Text(
        'Add Recipe',
        style: TextStyle(
          fontSize: ViewConstants.fontSize,
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
          builder: (context) => const EditRecipeView(),
        ),
      ),
    );
  }
}
