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

  String get title {
    var recipeName = _recipe.name == '' ? 'Recipe' : _recipe.name;
    return widget.edit ? 'Edit $recipeName' : 'New Recipe';
  }

  @override
  void initState() {
    super.initState();
    _recipe = widget.recipe ?? Recipe.empty();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => CustomScaffold(
        title: title,
        appBarColor: model.primaryColor,
        appBarTextColor: model.accentColor,
        backgroundColor: model.accentColor,
        body: Container(),
      ),
    );
  }
}
