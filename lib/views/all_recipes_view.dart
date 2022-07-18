import 'package:cookbook/components/recipe_grid.dart';
import 'package:cookbook/model/meal_type.dart';
import 'package:cookbook/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/add_recipe_button.dart';
import '../components/custom_scaffold.dart';
import '../components/custom_bottom_navigation_bar.dart';
import '../model/app_model.dart';

class AllRecipesView extends StatefulWidget {
  const AllRecipesView({Key? key}) : super(key: key);

  @override
  State<AllRecipesView> createState() => _AllRecipesViewState();
}

class _AllRecipesViewState extends State<AllRecipesView> {
  int _selectedIndex = 0;
  final List<Widget> _recipeCategories = [
    const RecipeGrid(mealType: MealType.breakfast),
    const RecipeGrid(mealType: MealType.lunch),
    const RecipeGrid(mealType: MealType.dinner),
    const RecipeGrid(mealType: MealType.dessert),
    const RecipeGrid(mealType: MealType.snack),
    const RecipeGrid(mealType: MealType.drink),
  ];

  void _onNavBarTap(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) {
        return CustomScaffold(
          title: 'Recipes',
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
                color: model.accentColor,
              ),
            ),
          ],
          appBarColor: model.primaryColor,
          appBarTextColor: model.accentColor,
          backgroundColor: model.accentColor,
          body: _recipeCategories[_selectedIndex],
          floatingActionButton: AddRecipeButton(
            backgroundColor: model.primaryColor,
            textColor: model.accentColor,
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            onTap: _onNavBarTap,
            selectedIndex: _selectedIndex,
            backgroundColor: model.primaryColor,
            fixedColor: model.accentColor,
            activeIconColor: model.accentColor,
          ),
        );
      },
    );
  }
}
