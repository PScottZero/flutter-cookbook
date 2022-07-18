import 'package:json_annotation/json_annotation.dart';

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

  Recipe({
    required this.name,
    required this.mealTypes,
    required this.ingredients,
    required this.instructions,
    this.images = const [],
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
