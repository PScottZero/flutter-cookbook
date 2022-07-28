import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';

import '../components/custom_scaffold.dart';
import '../components/custom_text_field.dart';
import '../components/edit_sub_recipe.dart';
import '../components/header.dart';
import '../components/image_picker.dart';
import '../components/edit_ingredient.dart';
import '../components/edit_instruction.dart';
import '../components/meal_types.dart';
import '../components/rounded_button.dart';
import '../components/rounded_container.dart';
import '../constants/view_constants.dart';
import '../model/app_model.dart';
import '../model/recipe.dart';

class EditRecipeView extends StatefulWidget {
  final Recipe? recipe;

  const EditRecipeView({
    Key? key,
    this.recipe,
  }) : super(key: key);

  @override
  State<EditRecipeView> createState() => _EditRecipeViewState();
}

class _EditRecipeViewState extends State<EditRecipeView> {
  late Recipe _recipe;
  late bool _editMode;

  String get title {
    var recipeName = _recipe.name == '' ? 'Recipe' : _recipe.name;
    return _editMode ? 'Edit $recipeName' : 'New Recipe';
  }

  void _deleteIngredient(int index) => setState(
        () => _recipe.deleteIngredient(
          _recipe.ingredients[index],
        ),
      );

  @override
  void initState() {
    super.initState();
    _editMode = widget.recipe != null;
    _recipe = _editMode ? widget.recipe!.clone() : Recipe.empty();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => CustomScaffold(
        title: title,
        appBarColor: model.theme.primaryColor,
        appBarTextColor: model.theme.accentColor1,
        backgroundColor: model.theme.accentColor1,
        appBarActions: [
          IconButton(
            onPressed: () {
              model.saveRecipe(_recipe);
              Navigator.pop(context, _recipe);
            },
            icon: Icon(
              Icons.save,
              color: model.theme.accentColor1,
            ),
          ),
        ],
        body: ListView(
          children: [
            Header(
              text: 'Recipe Name',
              textColor: model.theme.primaryColor,
              bottomPadding: false,
            ),
            RoundedContainer(
              margin: true,
              child: CustomTextField(
                text: _recipe.name,
                onChanged: (name) => _recipe.name = name,
              ),
            ),
            Header(
              text: 'Meal Types',
              textColor: model.theme.primaryColor,
              bottomPadding: false,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: ViewConstants.smallPadding,
                bottom: ViewConstants.smallPadding,
              ),
              child: MealTypes(
                selectedMealTypes: _recipe.mealTypes,
                toggleMealType: (mealType) => setState(
                  () => _recipe.mealTypes.contains(mealType)
                      ? _recipe.mealTypes.remove(mealType)
                      : _recipe.mealTypes.add(mealType),
                ),
              ),
            ),
            Header(
              text: 'Images',
              textColor: model.theme.primaryColor,
              bottomPadding: false,
            ),
            ImagePicker(
              images: _recipe.images,
              theme: model.theme,
              addImage: (image) => setState(
                () => _recipe.images.add(image),
              ),
              deleteImage: (index) => setState(
                () => _recipe.images.removeAt(index),
              ),
            ),
            ReorderableColumn(
              header: Header(
                text: 'Ingredients',
                textColor: model.theme.primaryColor,
              ),
              onReorder: (oldIndex, newIndex) => setState(
                () => _recipe.ingredients.insert(
                  newIndex,
                  _recipe.ingredients.removeAt(oldIndex),
                ),
              ),
              children: <Widget>[
                for (int index = 0; index < _recipe.ingredients.length; index++)
                  _recipe.ingredients[index].recipeId != null
                      ? EditSubRecipe(
                          key: ValueKey(index),
                          ingredient: _recipe.ingredients[index],
                          delete: () => _deleteIngredient(index),
                        )
                      : EditIngredient(
                          key: ValueKey(index),
                          ingredient: _recipe.ingredients[index],
                          theme: model.theme,
                          delete: () => _deleteIngredient(index),
                        ),
              ],
            ),
            RoundedButton(
              text: 'Add Ingredient',
              theme: model.theme,
              padding: true,
              onPressed: () => setState(() => _recipe.addIngredient()),
            ),
            RoundedButton(
              text: 'Add Sub-Recipe',
              theme: model.theme,
              padding: true,
              onPressed: () => setState(() => _recipe.addSubRecipe()),
            ),
            ReorderableColumn(
              header: Header(
                text: 'Instructions',
                textColor: model.theme.primaryColor,
              ),
              onReorder: (oldIndex, newIndex) => setState(
                () => _recipe.instructions.insert(
                  newIndex,
                  _recipe.instructions.removeAt(oldIndex),
                ),
              ),
              children: <Widget>[
                for (int index = 0;
                    index < _recipe.instructions.length;
                    index++)
                  EditInstruction(
                    key: ValueKey(index),
                    instruction: _recipe.instructions[index],
                    theme: model.theme,
                    delete: () => setState(
                      () => _recipe.deleteInstruction(
                        _recipe.instructions[index],
                      ),
                    ),
                  ),
              ],
            ),
            RoundedButton(
              text: 'Add Instruction',
              theme: model.theme,
              padding: true,
              onPressed: () => setState(() => _recipe.addInstruction()),
            ),
          ],
        ),
      ),
    );
  }
}
