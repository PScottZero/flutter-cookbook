import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/view_constants.dart';
import '../model/app_model.dart';
import '../model/meal_type.dart';
import 'recipe_tile.dart';

class RecipeGrid extends StatelessWidget {
  final MealType mealType;

  const RecipeGrid({Key? key, required this.mealType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: ViewConstants.smallPadding,
        crossAxisSpacing: ViewConstants.smallPadding,
        padding: const EdgeInsets.all(ViewConstants.smallPadding),
        children: model
            .recipesByMealType(mealType)
            .map(
              (recipe) => RecipeTile(
                recipe: recipe,
                primaryColor: const Color(0x77000000),
              ),
            )
            .toList(),
      ),
    );
  }
}
