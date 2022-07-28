import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/confirm_cancel_dialog.dart';
import '../components/custom_scaffold.dart';
import '../components/header.dart';
import '../components/image_carousel.dart';
import '../components/ingredient_pill.dart';
import '../components/instruction_pill.dart';
import '../components/meal_types.dart';
import '../components/sub_recipe.dart';
import '../constants/view_constants.dart';
import '../model/app_model.dart';
import '../model/recipe.dart';
import 'edit_recipe_view.dart';

class RecipeView extends StatefulWidget {
  final Recipe recipe;

  const RecipeView({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  late Recipe _recipe;

  @override
  void initState() {
    super.initState();
    _recipe = widget.recipe;
  }

  void _showDeleteDialog(AppModel model, BuildContext context) => showDialog(
        context: context,
        builder: (context) => ConfirmCancelDialog(
          title: 'Delete Recipe',
          message: 'Are you sure you want to delete this recipe?',
          confirmAction: 'Delete',
          backgroundColor: model.theme.accentColor1,
          onConfirmed: () {
            model.deleteRecipe(_recipe);
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => CustomScaffold(
        title: _recipe.name,
        appBarColor: model.theme.primaryColor,
        appBarTextColor: model.theme.accentColor1,
        backgroundColor: model.theme.accentColor1,
        appBarActions: [
          IconButton(
            onPressed: () async {
              var recipe = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditRecipeView(recipe: _recipe),
                ),
              );
              if (recipe != null) {
                setState(() => _recipe = recipe);
              }
            },
            icon: Icon(
              Icons.edit,
              color: model.theme.accentColor1,
            ),
          ),
          IconButton(
            onPressed: () => _showDeleteDialog(model, context),
            icon: Icon(
              Icons.delete,
              color: model.theme.accentColor1,
            ),
          ),
        ],
        body: ListView(
          children: [
            _recipe.images.isNotEmpty
                ? ImageCarousel(images: _recipe.images)
                : const SizedBox(height: ViewConstants.smallPadding / 2),
            _recipe.mealTypes.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: ViewConstants.smallPadding,
                      bottom: ViewConstants.smallPadding,
                    ),
                    child: MealTypes(
                      selectedMealTypes: _recipe.mealTypes,
                      editable: false,
                    ),
                  )
                : Container(),
            Header(
              text: 'Ingredients',
              textColor: model.theme.primaryColor,
            ),
            Column(
              children: _recipe.ingredients
                  .map(
                    (ingredient) => ingredient.recipeId != null
                        ? SubRecipe(
                            recipeId: ingredient.recipeId!,
                            model: model,
                          )
                        : IngredientPill(
                            ingredient: ingredient,
                            theme: model.theme,
                          ),
                  )
                  .toList(),
            ),
            Header(
              text: 'Instructions',
              textColor: model.theme.primaryColor,
            ),
            Column(
              children: _recipe.instructions
                  .map(
                    (instruction) => InstructionPill(text: instruction.value),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
