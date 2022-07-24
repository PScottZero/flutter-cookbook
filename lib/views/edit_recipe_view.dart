import 'package:cookbook/model/instruction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reorderables/reorderables.dart';

import '../components/custom_scaffold.dart';
import '../components/ingredient_editor.dart';
import '../components/instruction_editor.dart';
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
        appBarColor: model.primaryColor,
        appBarTextColor: model.accentColor,
        backgroundColor: model.accentColor,
        appBarActions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.save,
              color: model.accentColor,
            ),
          ),
        ],
        body: ListView(
          children: [
            ReorderableColumn(
              header: const Text('Ingredients'),
              onReorder: (oldIndex, newIndex) {},
              children: <Widget>[
                for (int index = 0; index < _recipe.ingredients.length; index++)
                  IngredientEditor(
                    key: ValueKey(index),
                    ingredient: _recipe.ingredients[index],
                    color: model.theme,
                    moveUp: () => setState(
                      () => _recipe.moveIngredientUp(
                        _recipe.ingredients[index],
                      ),
                    ),
                    moveDown: () => setState(
                      () => _recipe.moveIngredientDown(
                        _recipe.ingredients[index],
                      ),
                    ),
                    delete: () => setState(
                      () => _recipe.deleteIngredient(
                        _recipe.ingredients[index],
                      ),
                    ),
                  ),
              ],
            ),
            ReorderableColumn(
              header: const Text('Instructions'),
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
                    moveUp: () => setState(
                      () => _recipe.moveInstructionUp(
                        _recipe.instructions[index],
                      ),
                    ),
                    moveDown: () => setState(
                      () => _recipe.moveInstructionDown(
                        _recipe.instructions[index],
                      ),
                    ),
                    delete: () => setState(
                      () => _recipe.deleteInstruction(
                        _recipe.instructions[index],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
