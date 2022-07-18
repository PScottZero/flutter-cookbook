import 'package:cookbook/views/edit_recipe_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_scaffold.dart';
import '../components/image_carousel.dart';
import '../components/item_list.dart';
import '../model/app_model.dart';
import '../model/recipe.dart';

class RecipeView extends StatelessWidget {
  final Recipe recipe;

  const RecipeView({
    Key? key,
    required this.recipe,
  }) : super(key: key);

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
                builder: (context) => EditRecipeView(
                  recipe: recipe,
                  edit: true,
                ),
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
            ItemList(
              title: 'Ingredients',
              items: recipe.ingredients,
              primaryColor: model.primaryColor,
              accentColor: model.accentColor,
            ),
            ItemList(
              title: 'Instructions',
              items: recipe.instructions,
              primaryColor: model.primaryColor,
              accentColor: model.accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
