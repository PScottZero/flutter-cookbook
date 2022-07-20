import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'ingredient.dart';
import 'meal_type.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  String name;
  List<MealType> mealTypes;
  List<Ingredient> ingredients;
  List<String> instructions;
  List<String> images;

  String id = const Uuid().v1();

  Recipe({
    required this.name,
    required this.mealTypes,
    required this.ingredients,
    required this.instructions,
    this.images = const [],
  });

  Recipe.empty()
      : name = '',
        mealTypes = [],
        ingredients = [],
        instructions = [],
        images = [];

  Recipe clone() => Recipe(
        name: name,
        mealTypes: mealTypes,
        ingredients: ingredients,
        instructions: instructions,
        images: images,
      );

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
