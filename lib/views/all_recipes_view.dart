import 'package:cookbook/model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_scaffold.dart';
import '../components/recipe_tile.dart';
import '../constants/view_constants.dart';

class AllRecipesView extends StatefulWidget {
  const AllRecipesView({Key? key}) : super(key: key);

  @override
  State<AllRecipesView> createState() => _AllRecipesViewState();
}

class _AllRecipesViewState extends State<AllRecipesView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) {
        return CustomScaffold(
          title: 'Recipes',
          body: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: ViewConstants.smallPadding,
            crossAxisSpacing: ViewConstants.smallPadding,
            padding: const EdgeInsets.all(ViewConstants.smallPadding),
            children:
                model.recipes.map((recipe) => RecipeTile(recipe)).toList(),
          ),
        );
      },
    );
  }
}
