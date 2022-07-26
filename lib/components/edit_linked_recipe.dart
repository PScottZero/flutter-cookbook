import 'package:cookbook/model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/ingredient.dart';
import '../model/recipe.dart';
import 'rounded_container.dart';

class EditLinkedRecipe extends StatelessWidget {
  final Ingredient ingredient;

  const EditLinkedRecipe({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => RoundedContainer(
        child: DropdownButtonFormField<Recipe>(
          value: ingredient.recipeId != ''
              ? model.recipes
                  .where((recipe) => ingredient.recipeId == recipe.id)
                  .first
              : null,
          decoration: const InputDecoration(labelText: 'Linked Recipe'),
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
      ),
    );
  }
}
