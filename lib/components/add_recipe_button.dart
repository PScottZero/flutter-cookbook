import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../views/edit_recipe_view.dart';

class AddRecipeButton extends StatelessWidget {
  const AddRecipeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text(
        'Add Recipe',
        style: TextStyle(fontSize: ViewConstants.smallFont),
      ),
      icon: const Icon(Icons.add),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EditRecipeView(),
        ),
      ),
    );
  }
}
