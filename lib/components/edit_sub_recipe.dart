import 'package:cookbook/model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/view_constants.dart';
import '../model/ingredient.dart';
import '../model/recipe.dart';
import 'rounded_button.dart';
import 'rounded_container.dart';

class EditSubRecipe extends StatelessWidget {
  final Ingredient ingredient;
  final MaterialColor color;
  final Function() delete;

  const EditSubRecipe({
    Key? key,
    required this.ingredient,
    required this.color,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => RoundedContainer(
        child: Column(
          children: [
            DropdownButtonFormField<Recipe>(
              value: ingredient.recipeId != ''
                  ? model.recipes
                      .where((recipe) => ingredient.recipeId == recipe.id)
                      .first
                  : null,
              decoration: const InputDecoration(labelText: 'Sub-Recipe'),
              onChanged: (recipe) => ingredient.recipeId = recipe?.id,
              items: model.recipes
                  .map(
                    (recipe) => DropdownMenuItem(
                      value: recipe,
                      child: Text(recipe.name),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: ViewConstants.smallPadding),
            RoundedButton(
              icon: Icons.delete,
              color: color,
              onPressed: delete,
            ),
          ],
        ),
      ),
    );
  }
}
