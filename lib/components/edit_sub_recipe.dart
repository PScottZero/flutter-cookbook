import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/view_constants.dart';
import '../model/app_model.dart';
import '../model/ingredient.dart';
import '../model/recipe.dart';
import 'rounded_button.dart';
import 'rounded_container.dart';

class EditSubRecipe extends StatelessWidget {
  final Ingredient ingredient;
  final Function() delete;

  const EditSubRecipe({
    Key? key,
    required this.ingredient,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => RoundedContainer(
        child: Column(
          children: [
            DropdownButtonFormField<Recipe>(
              value: () {
                var matches = model.recipes
                    .where((recipe) => ingredient.recipeId == recipe.id);
                return matches.isNotEmpty ? matches.first : null;
              }(),
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
            const SizedBox(height: ViewConstants.mediumPadding),
            RoundedButton(
              icon: Icons.delete,
              theme: model.theme,
              onPressed: delete,
            ),
          ],
        ),
      ),
    );
  }
}
