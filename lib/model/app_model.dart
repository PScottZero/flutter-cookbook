import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/theme_options.dart';
import 'example_recipes.dart';
import 'meal_type.dart';
import 'recipe.dart';

const backupDir = '/storage/emulated/0/Documents/CookbookBU';
const storageDir = 'recipes';

List<Recipe> loadRecipesFromAppDirectory(String appDirectory) {
  List<Recipe> recipes = [];
  var recipesDirectory = Directory('$appDirectory/$storageDir/');
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
        var hasMealType = false;
        for (var mealType in filters) {
          if (recipe.mealTypes.contains(mealType)) {
            hasMealType = true;
          }
        }
        return hasMealType || filters.isEmpty;
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
    // loadRecipes();
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
    notifyListeners();
  }

  void loadTestRecipes() async {
    recipes = await exampleRecipes;
    notifyListeners();
  }

  List<Recipe> recipesByMealType(MealType mealType) =>
      recipes.where((recipe) => recipe.mealTypes.contains(mealType)).toList();

  bool mealTypeIsSelected(MealType mealType) => filters.contains(mealType);

  void toggleMealTypeFilter(MealType mealType) {
    mealTypeIsSelected(mealType)
        ? filters.remove(mealType)
        : filters.add(mealType);
    notifyListeners();
  }

  Future<void> saveRecipe(Recipe recipe) async {
    var index =
        recipes.indexWhere((existingRecipe) => existingRecipe.id == recipe.id);
    if (index >= 0) recipes.removeAt(index);
    recipes.add(recipe);
    final directory = (await getApplicationDocumentsDirectory()).path;
    final file = File('$directory/$storageDir/${recipe.id}.json');
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    file.writeAsStringSync(jsonEncode(recipe));
    notifyListeners();
  }

  Future<void> deleteRecipe(Recipe recipe) async {
    recipes.remove(recipe);
    final directory = (await getApplicationDocumentsDirectory()).path;
    final file = File('$directory/$storageDir/${recipe.id}.json');
    file.deleteSync();
    notifyListeners();
  }

  Future<String> backupRecipes() async {
    if (await Permission.manageExternalStorage.request().isGranted) {
      final directory = Directory(backupDir);
      if (directory.existsSync()) {
        directory.deleteSync(recursive: true);
      }
      directory.createSync();
      for (var recipe in recipes) {
        final file = File('$backupDir/${recipe.id}.json');
        file.createSync(recursive: true);
        file.writeAsStringSync(jsonEncode(recipe));
      }
      return 'Successfully backed up recipes';
    }
    return 'Permissions error';
  }

  Future<String> restoreRecipes() async {
    if (await Permission.manageExternalStorage.request().isGranted) {
      final backupDirectory = Directory(backupDir);
      if (!backupDirectory.existsSync()) return 'No backup found';
      while (recipes.isNotEmpty) {
        await deleteRecipe(recipes[0]);
      }
      var recipeFiles = backupDirectory.listSync();
      if (recipeFiles.isNotEmpty) {
        for (var recipeFile in recipeFiles) {
          final recipeJson =
              jsonDecode(File(recipeFile.path).readAsStringSync());
          await saveRecipe(Recipe.fromJson(recipeJson));
        }
      }
      notifyListeners();
      return 'Successfully restored recipes';
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
