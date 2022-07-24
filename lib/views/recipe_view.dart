import 'package:cookbook/views/edit_recipe_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_scaffold.dart';
import '../components/image_carousel.dart';
import '../components/collapsible_list.dart';
import '../components/text_pill.dart';
import '../model/app_model.dart';
import '../model/recipe.dart';

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
        ],
        body: ListView(
          children: [
            recipe.images.isNotEmpty
                ? ImageCarousel(images: recipe.images)
                : Container(),
            CollapsibleList(
              title: 'Ingredients',
              items: recipe.ingredients
                  .map(
                    (ingredients) => TextPill(text: '$ingredients'),
                  )
                  .toList(),
              primaryColor: model.primaryColor,
              accentColor: model.accentColor,
            ),
            CollapsibleList(
              title: 'Instructions',
              items: recipe.instructions
                  .map(
                    (instruction) => TextPill(text: instruction),
                  )
                  .toList(),
              primaryColor: model.primaryColor,
              accentColor: model.accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
