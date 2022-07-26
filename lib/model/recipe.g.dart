// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      name: json['name'] as String,
      mealTypes: (json['mealTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$MealTypeEnumMap, e))
          .toList(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      instructions: (json['instructions'] as List<dynamic>)
          .map((e) => Instruction.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    )..id = json['id'] as String;

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mealTypes':
          instance.mealTypes.map((e) => _$MealTypeEnumMap[e]!).toList(),
      'ingredients': instance.ingredients,
      'instructions': instance.instructions,
      'images': instance.images,
    };

const _$MealTypeEnumMap = {
  MealType.breakfast: 'breakfast',
  MealType.lunch: 'lunch',
  MealType.dinner: 'dinner',
  MealType.dessert: 'dessert',
  MealType.snack: 'snack',
  MealType.drink: 'drink',
};
