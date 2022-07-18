import 'dart:convert';
import 'dart:io';

import 'package:cookbook/model/meal_type.dart';
import 'package:cookbook/model/theme_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'example_recipes.dart';
import 'recipe.dart';

List<Recipe> loadRecipesFromAppDirectory(String appDirectory) {
  List<Recipe> recipes = [];
  var recipesDirectory = Directory('$appDirectory/recipes/');
  if (recipesDirectory.existsSync()) {
    var recipeFiles = recipesDirectory.listSync();
    if (recipeFiles.isNotEmpty) {
      for (var recipeFile in recipeFiles) {
        var recipe = File(recipeFile.path);
        recipes.add(Recipe.fromJson(jsonDecode(recipe.readAsStringSync())));
      }
    }
  }
  return recipes;
}

class AppModel extends ChangeNotifier {
  List<Recipe> recipes = [];
  MaterialColor theme = Colors.teal;
  Color get primaryColor => theme[300]!;
  Color get accentColor => theme[50]!;

  AppModel() {
    loadTestRecipes();
    loadTheme();
  }

  void loadRecipes() async {
    final appDir = await getApplicationDocumentsDirectory();
    recipes = await compute(loadRecipesFromAppDirectory, appDir.path);
    notifyListeners();
  }

  void loadTheme() async {
    final preferences = await SharedPreferences.getInstance();
    theme = themeOptions[preferences.getInt('themeIndex') ?? 0];
  }

  void loadTestRecipes() async {
    recipes = await exampleRecipes;
    notifyListeners();
  }

  List<Recipe> recipesByMealType(MealType mealType) =>
      recipes.where((recipe) => recipe.mealTypes.contains(mealType)).toList();

  void setTheme(MaterialColor materialColor) async {
    theme = materialColor;
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt('themeIndex', themeOptions.indexOf(theme));
    notifyListeners();
  }
}
