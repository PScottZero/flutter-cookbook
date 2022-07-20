import 'package:cookbook/components/ingredient_editor.dart';
import 'package:cookbook/components/instruction_editor.dart';
import 'package:cookbook/components/collapsible_list.dart';
import 'package:cookbook/components/rounded_button.dart';
import 'package:cookbook/model/ingredient.dart';
import 'package:cookbook/model/move_delete_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_scaffold.dart';
import '../model/app_model.dart';
import '../model/recipe.dart';

class EditRecipeView extends StatefulWidget {
  final bool edit;
  final Recipe? recipe;

  const EditRecipeView({
    Key? key,
    this.edit = false,
    this.recipe,
  }) : super(key: key);

  @override
  State<EditRecipeView> createState() => _EditRecipeViewState();
}

class _EditRecipeViewState extends State<EditRecipeView> {
  late Recipe _recipe;
  late MoveDeleteFunctions _moveDeleteFunctions;
  AppModel? _model;

  String get title {
    var recipeName = _recipe.name == '' ? 'Recipe' : _recipe.name;
    return widget.edit ? 'Edit $recipeName' : 'New Recipe';
  }

  @override
  void initState() {
    super.initState();
    _recipe = widget.recipe?.clone() ?? Recipe.empty();
    _moveDeleteFunctions = MoveDeleteFunctions(
      moveUp: moveUp,
      moveDown: moveDown,
      delete: delete,
    );
  }

  void addIngredient() => setState(() {
        _recipe.ingredients.add(Ingredient.empty());
      });

  void addInstruction() => setState(() {
        _recipe.instructions.add('');
      });

  void moveUp(bool isIngredient, int index) {
    swap(getList(isIngredient), index, index - 1);
    _model?.refresh();
  }

  void moveDown(bool isIngredient, int index) {
    swap(getList(isIngredient), index, index + 1);
    _model?.refresh();
  }

  void delete(bool isIngredient, int index) => setState(() {
        getList(isIngredient).removeAt(index);
      });

  List getList(bool isIngredient) =>
      isIngredient ? _recipe.ingredients : _recipe.instructions;

  void swap(List list, int index1, int index2) {
    if (index2 >= 0 && index2 < list.length) {
      var temp = list[index1];
      list[index1] = list[index2];
      list[index2] = temp;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) {
        _model = model;
        return CustomScaffold(
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
              CollapsibleList(
                title: 'Ingredients',
                primaryColor: model.primaryColor,
                accentColor: model.accentColor,
                items: _recipe.ingredients
                        .asMap()
                        .entries
                        .map(
                          (entry) => IngredientEditor(
                            key: ValueKey(entry.key),
                            ingredient: entry.value,
                            moveDeleteFunctions: _moveDeleteFunctions,
                            color: model.theme,
                          ),
                        )
                        .toList()
                        .cast<Widget>() +
                    [
                      RoundedButton(
                        key: ValueKey(_recipe.ingredients.length),
                        text: 'Add Ingredient',
                        color: model.theme,
                        onPressed: addIngredient,
                      )
                    ],
              ),
              CollapsibleList(
                title: 'Instructions',
                items: _recipe.instructions
                        .asMap()
                        .entries
                        .map(
                          (entry) => InstructionEditor(
                            key: ValueKey(entry.key),
                            initialValue: entry.value,
                            moveDeleteFunctions: _moveDeleteFunctions,
                            color: model.theme,
                          ),
                        )
                        .toList()
                        .cast<Widget>() +
                    [
                      RoundedButton(
                        key: ValueKey(_recipe.instructions.length),
                        text: 'Add Instruction',
                        color: model.theme,
                        onPressed: addInstruction,
                      )
                    ],
                primaryColor: model.primaryColor,
                accentColor: model.accentColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
