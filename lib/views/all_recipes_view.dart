import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/add_recipe_button.dart';
import '../components/custom_scaffold.dart';
import '../components/meal_types.dart';
import '../components/recipe_tile.dart';
import '../components/search_bar.dart';
import '../constants/view_constants.dart';
import '../model/app_model.dart';
import 'settings_view.dart';

class AllRecipesView extends StatelessWidget {
  const AllRecipesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) {
        return CustomScaffold(
          title: 'Recipes',
          appBarColor: model.theme.primaryColor,
          appBarTextColor: model.theme.accentColor1,
          backgroundColor: model.theme.accentColor1,
          appBarActions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsView(),
                ),
              ),
              icon: Icon(
                Icons.settings,
                color: model.theme.accentColor1,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: SearchBar(theme: model.theme),
          ),
          body: Consumer<AppModel>(
            builder: (context, model, child) => Column(
              children: [
                const SizedBox(height: ViewConstants.smallPadding),
                MealTypes(
                  selectedMealTypes: model.mealTypeFilters,
                  toggleMealType: (mealType) =>
                      model.toggleMealTypeFilter(mealType),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: ViewConstants.smallPadding,
                    crossAxisSpacing: ViewConstants.smallPadding,
                    padding: const EdgeInsets.all(ViewConstants.smallPadding),
                    children: model.filteredRecipes
                        .map(
                          (recipe) => RecipeTile(
                            recipe: recipe,
                            primaryColor:
                                ViewConstants.imageTextBackgroundColor,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: AddRecipeButton(
            backgroundColor: model.theme.primaryColor,
            textColor: model.theme.accentColor1,
            model: model,
          ),
        );
      },
    );
  }
}
