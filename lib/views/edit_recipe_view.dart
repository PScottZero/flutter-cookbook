import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/collapsible_list.dart';
import '../components/custom_scaffold.dart';
import '../components/ingredient_editor.dart';
import '../components/instruction_editor.dart';
import '../components/rounded_button.dart';
import '../model/app_model.dart';

class EditRecipeView extends StatefulWidget {
  final bool edit;

  const EditRecipeView({
    Key? key,
    this.edit = false,
  }) : super(key: key);

  @override
  State<EditRecipeView> createState() => _EditRecipeViewState();
}

class _EditRecipeViewState extends State<EditRecipeView> {
  AppModel? _model;

  String get title {
    var recipeName = _model?.selectedRecipe?.name == ''
        ? 'Recipe'
        : _model?.selectedRecipe?.name ?? '';
    return widget.edit ? 'Edit $recipeName' : 'New Recipe';
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
                items: model.selectedRecipe!.ingredients
                        .asMap()
                        .entries
                        .map(
                          (entry) => IngredientEditor(
                            key: ValueKey(entry.key),
                            ingredient: entry.value,
                            color: model.theme,
                            moveUp: () => setState(
                              () => model.selectedRecipe!
                                  .moveIngredientUp(entry.key),
                            ),
                            moveDown: () => setState(
                              () => model.selectedRecipe!
                                  .moveIngredientDown(entry.key),
                            ),
                            delete: () => setState(
                              () => model.selectedRecipe!
                                  .deleteIngredient(entry.key),
                            ),
                          ),
                        )
                        .toList()
                        .cast<Widget>() +
                    [
                      RoundedButton(
                        key: ValueKey(model.selectedRecipe!.ingredients.length),
                        text: 'Add Ingredient',
                        color: model.theme,
                        onPressed: () => setState(
                          () => model.selectedRecipe!.addIngredient(),
                        ),
                      )
                    ],
              ),
              CollapsibleList(
                title: 'Instructions',
                items: model.selectedRecipe!.instructions
                        .asMap()
                        .entries
                        .map(
                          (entry) => InstructionEditor(
                            key: ValueKey(entry.key),
                            initialValue: entry.value,
                            color: model.theme,
                            moveUp: () => setState(
                              () => model.selectedRecipe!
                                  .moveInstructionUp(entry.key),
                            ),
                            moveDown: () => setState(
                              () => model.selectedRecipe!
                                  .moveInstructionDown(entry.key),
                            ),
                            delete: () => setState(
                              () => model.selectedRecipe!
                                  .deleteInstruction(entry.key),
                            ),
                          ),
                        )
                        .toList()
                        .cast<Widget>() +
                    [
                      RoundedButton(
                        key:
                            ValueKey(model.selectedRecipe!.instructions.length),
                        text: 'Add Instruction',
                        color: model.theme,
                        onPressed: () => setState(
                          () => model.selectedRecipe!.addInstruction(),
                        ),
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
