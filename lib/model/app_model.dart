import 'dart:convert';
import 'dart:io';

import 'package:cookbook/model/meal_type.dart';
import 'package:cookbook/constants/theme_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
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
  List<Recipe> get filteredRecipes {
    var filtered = recipes.where(
      (recipe) {
        for (var mealType in filters) {
          if (!recipe.mealTypes.contains(mealType)) {
            return false;
          }
        }
        return true;
      },
    ).toList();
    filtered.sort((a, b) => a.name.compareTo(b.name));
    return filtered;
  }

  List<MealType> filters = [];
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
    theme = themeOptions[preferences.getInt('themeIndex') ?? 6];
  }

  void loadTestRecipes() async {
    recipes = await exampleRecipes;
    notifyListeners();
  }

  List<Recipe> recipesByMealType(MealType mealType) =>
      recipes.where((recipe) => recipe.mealTypes.contains(mealType)).toList();

  void toggleMealTypeFilter(MealType mealType) {
    mealTypeIsSelected(mealType)
        ? filters.remove(mealType)
        : filters.add(mealType);
    notifyListeners();
  }

  bool mealTypeIsSelected(MealType mealType) => filters.contains(mealType);

  Future<void> addRecipe(Recipe recipe) async {
    var index =
        recipes.indexWhere((existingRecipe) => existingRecipe.id == recipe.id);
    if (index >= 0) recipes.removeAt(index);
    recipes.add(recipe);
    final directory = (await getApplicationDocumentsDirectory()).path;
    final file = File('$directory/coins/${recipe.id}.json');
    if (!file.existsSync()) {
      file.createSync();
    }
    file.writeAsStringSync(jsonEncode(recipe));
    notifyListeners();
  }

  Future<void> deleteRecipe(Recipe recipe) async {
    recipes.remove(recipe);
    final directory = (await getApplicationDocumentsDirectory()).path;
    final file = File('$directory/recipes/${recipe.id}.json');
    file.deleteSync();
    notifyListeners();
  }

  Future<String> backupRecipes() async {
    if (await Permission.manageExternalStorage.request().isGranted) {
      final directory = Directory('/storage/emulated/0/Documents/CookbookBU/');
      if (directory.existsSync()) {
        directory.deleteSync(recursive: true);
      }
      directory.createSync();
      for (var recipe in recipes) {
        final file = File(
            '/storage/emulated/0/Documents/NumismaticBU/${recipe.id}.json');
        file.createSync();
        file.writeAsStringSync(jsonEncode(recipe));
      }
      return 'Successfully backed up recipes';
    }
    return 'Permissions error';
  }

  Future<String> restoreRecipes() async {
    if (await Permission.manageExternalStorage.request().isGranted) {
      final backupDirectory =
          Directory('/storage/emulated/0/Documents/NumismaticBU/');
      if (!backupDirectory.existsSync()) {
        return 'No backup found';
      }
      while (recipes.isNotEmpty) {
        await deleteRecipe(recipes[0]);
      }
      var recipeFiles = backupDirectory.listSync();
      if (recipeFiles.isNotEmpty) {
        for (var recipeFile in recipeFiles) {
          final recipeJson =
              jsonDecode(File(recipeFile.path).readAsStringSync());
          await addRecipe(Recipe.fromJson(recipeJson));
        }
      }
      notifyListeners();
      return 'Successfully restored coins';
    }
    return 'Permissions error';
  }

  void setTheme(MaterialColor materialColor) async {
    theme = materialColor;
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt('themeIndex', themeOptions.indexOf(theme));
    notifyListeners();
  }
}
