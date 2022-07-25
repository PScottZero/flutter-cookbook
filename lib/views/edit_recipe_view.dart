import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';

import '../components/custom_scaffold.dart';
import '../components/header.dart';
import '../components/image_picker.dart';
import '../components/ingredient_editor.dart';
import '../components/instruction_editor.dart';
import '../components/rounded_button.dart';
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
  late TextEditingController _recipeNameTextController;

  String get title {
    var recipeName = _recipe.name == '' ? 'Recipe' : _recipe.name;
    return _editMode ? 'Edit $recipeName' : 'New Recipe';
  }

  @override
  void initState() {
    super.initState();
    _editMode = widget.recipe != null;
    _recipe = _editMode ? widget.recipe!.clone() : Recipe.empty();
    _recipeNameTextController = TextEditingController(text: _recipe.name);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => CustomScaffold(
        title: title,
        appBarColor: model.primaryColor,
        appBarTextColor: model.accentColor,
        backgroundColor: model.accentColor,
        appBarActions: [
          IconButton(
            onPressed: () {
              model.saveRecipe(_recipe);
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.save,
              color: model.accentColor,
            ),
          ),
        ],
        body: ListView(
          children: [
            Container(
              color: model.primaryColor,
              padding: const EdgeInsets.fromLTRB(
                ViewConstants.smallPadding,
                ViewConstants.smallPadding,
                ViewConstants.smallPadding,
                ViewConstants.largePadding,
              ),
              child: TextField(
                controller: _recipeNameTextController,
                style: TextStyle(
                  fontSize: ViewConstants.smallFont,
                  color: model.accentColor,
                ),
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: 'Recipe Name',
                  hintText: 'Enter recipe name',
                  labelStyle: TextStyle(color: model.accentColor),
                  hintStyle: TextStyle(color: model.accentColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: model.accentColor,
                    ),
                  ),
                ),
                onChanged: (value) => setState(() => _recipe.name = value),
              ),
            ),
            ImagePicker(
              images: _recipe.images,
              addImage: (image) => setState(() => _recipe.images.add(image)),
              color: model.theme,
            ),
            ReorderableColumn(
              header: Header(
                text: 'Ingredients',
                color: model.theme,
              ),
              onReorder: (oldIndex, newIndex) => setState(
                () => _recipe.ingredients.insert(
                  newIndex,
                  _recipe.ingredients.removeAt(oldIndex),
                ),
              ),
              children: <Widget>[
                for (int index = 0; index < _recipe.ingredients.length; index++)
                  IngredientEditor(
                    key: ValueKey(index),
                    ingredient: _recipe.ingredients[index],
                    color: model.theme,
                    delete: () => setState(
                      () => _recipe.deleteIngredient(
                        _recipe.ingredients[index],
                      ),
                    ),
                  ),
              ],
            ),
            RoundedButton(
              text: 'Add Ingredient',
              color: model.theme,
              padding: true,
              onPressed: () => setState(() => _recipe.addIngredient()),
            ),
            ReorderableColumn(
              header: Header(
                text: 'Instructions',
                color: model.theme,
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
                  InstructionEditor(
                    key: ValueKey(index),
                    instruction: _recipe.instructions[index],
                    color: model.theme,
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
              color: model.theme,
              padding: true,
              onPressed: () => setState(() => _recipe.addInstruction()),
            ),
          ],
        ),
      ),
    );
  }
}
