import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'ingredient.dart';
import 'instruction.dart';
import 'meal_type.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  String id = const Uuid().v1();

  String name;
  List<MealType> mealTypes;
  List<Ingredient> ingredients;
  List<Instruction> instructions;
  List<String> images;

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
    var clonedInstructions =
        instructions.map((instruction) => instruction.clone()).toList();
    var clonedRecipe = Recipe(
      name: name,
      mealTypes: List.from(mealTypes),
      ingredients: List.from(clonedIngredients),
      instructions: List.from(clonedInstructions),
      images: List.from(images),
    );
    clonedRecipe.id = id;
    return clonedRecipe;
  }

  void addIngredient() => ingredients.add(Ingredient.empty());

  void addInstruction() => instructions.add(Instruction());

  void addSubRecipe() => ingredients.add(Ingredient.subRecipe());

  void deleteIngredient(Ingredient ingredient) =>
      ingredients.remove(ingredient);

  void deleteInstruction(Instruction instruction) =>
      instructions.remove(instruction);

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
