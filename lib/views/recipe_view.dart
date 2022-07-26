import 'package:cookbook/components/meal_types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_scaffold.dart';
import '../components/header.dart';
import '../components/image_carousel.dart';
import '../components/text_pill.dart';
import '../constants/view_constants.dart';
import '../model/app_model.dart';
import '../model/recipe.dart';
import 'edit_recipe_view.dart';

class RecipeView extends StatelessWidget {
  final Recipe recipe;

  const RecipeView({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => CustomScaffold(
        title: recipe.name,
        appBarColor: model.primaryColor,
        appBarTextColor: model.accentColor,
        backgroundColor: model.accentColor,
        appBarActions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditRecipeView(recipe: recipe),
              ),
            ),
            icon: Icon(
              Icons.edit,
              color: model.accentColor,
            ),
          ),
          IconButton(
            onPressed: () {
              model.deleteRecipe(recipe);
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.delete,
              color: model.accentColor,
            ),
          ),
        ],
        body: ListView(
          children: [
            recipe.images.isNotEmpty
                ? ImageCarousel(images: recipe.images)
                : const SizedBox(height: ViewConstants.smallPadding / 2),
            Padding(
              padding: const EdgeInsets.only(
                top: ViewConstants.smallPadding,
                bottom: ViewConstants.smallPadding,
              ),
              child: MealTypes(
                selectedMealTypes: recipe.mealTypes,
                editable: false,
              ),
            ),
            Header(
              text: 'Ingredients',
              color: model.theme,
            ),
            Column(
              children: recipe.ingredients
                  .map(
                    (ingredients) => TextPill(text: '$ingredients'),
                  )
                  .toList(),
            ),
            Header(
              text: 'Instructions',
              color: model.theme,
            ),
            Column(
              children: recipe.instructions
                  .map(
                    (instruction) => TextPill(text: instruction.value),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
