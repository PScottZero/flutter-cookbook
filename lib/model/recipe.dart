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

  Recipe clone() {
    var clonedIngredients =
        ingredients.map((ingredient) => ingredient.clone()).toList();
    return Recipe(
      name: name,
      mealTypes: mealTypes,
      ingredients: clonedIngredients,
      instructions: instructions,
      images: images,
    );
  }

  void addIngredient() => ingredients.add(Ingredient.empty());

  void addInstruction() => instructions.add('');

  void deleteIngredient(int index) => ingredients.removeAt(index);

  void deleteInstruction(int index) => instructions.removeAt(index);

  void moveIngredientUp(int index) =>
      ingredients.insert(index - 1, ingredients.removeAt(index));

  void moveIngredientDown(int index) =>
      ingredients.insert(index + 1, ingredients.removeAt(index));

  void moveInstructionUp(int index) =>
      instructions.insert(index - 1, instructions.removeAt(index));

  void moveInstructionDown(int index) =>
      instructions.insert(index + 1, instructions.removeAt(index));

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
