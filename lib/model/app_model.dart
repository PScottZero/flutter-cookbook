import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

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
  bool loading = false;

  AppModel() {
    loadTestRecipes();
  }

  void loadRecipes() async {
    loading = true;
    final appDir = await getApplicationDocumentsDirectory();
    recipes = await compute(loadRecipesFromAppDirectory, appDir.path);
    loading = false;
    notifyListeners();
  }

  void loadTestRecipes() async {
    recipes = await exampleRecipes;
    notifyListeners();
  }
}
