import 'dart:convert';

import 'package:flutter/services.dart';

import 'ingredient.dart';
import 'instruction.dart';
import 'meal_type.dart';
import 'recipe.dart';
import 'unit.dart';

Future<List<Recipe>> get exampleRecipes async => [
      Recipe(
        name: 'Vanilla Ice Cream',
        mealTypes: [
          MealType.dessert,
        ],
        ingredients: [
          Ingredient(name: 'Egg Yolk', amount: '6'),
          Ingredient(name: 'Heavy Cream', amount: '2', unit: Unit.cup),
          Ingredient(name: 'Whole Milk', amount: '2', unit: Unit.cup),
          Ingredient(name: 'Sugar', amount: '3/4', unit: Unit.cup),
          Ingredient(name: 'Salt', amount: '1/8', unit: Unit.tsp),
          Ingredient(name: 'Vanilla Bean', amount: '1'),
        ],
        instructions: [
          Instruction(
            'Add cream, milk, sugar, and salt to a medium saucepan over medium heat',
          ),
          Instruction(
            'Heat mixture until bubbles start forming on edges',
          ),
          Instruction(
            'In a large bowl, add egg yolks and slowly add cream mixture over a strainer',
          ),
          Instruction(
            'Add mixture back to saucepan and heat on low until mixture reaches 180°F',
          ),
          Instruction(
            'Cool mixture down in ice bath for 5 min then',
          ),
        ],
        images: [
          await loadImageBase64('vanilla-ice-cream-1.jpg'),
          await loadImageBase64('vanilla-ice-cream-2.jpg'),
        ],
      ),
      Recipe(
        name: 'Pizza Sauce',
        mealTypes: [
          MealType.lunch,
          MealType.dinner,
        ],
        ingredients: [
          Ingredient(
            name: 'crushed san marzano tomatoes',
            amount: '1',
            unit: Unit.custom,
            customUnit: 'can',
          ),
          Ingredient(
            name: 'garlic',
            amount: '3',
            unit: Unit.custom,
            customUnit: 'cloves',
          ),
          Ingredient(
            name: 'sugar',
            amount: '1',
            unit: Unit.tbsp,
          ),
          Ingredient(
            name: 'olive oil',
            amount: '3',
            unit: Unit.tbsp,
          ),
          Ingredient(
            name: 'oregano',
            amount: '3',
            unit: Unit.tbsp,
          ),
        ],
        instructions: [
          Instruction(
            'Place tomatoes, garlic, sugar, and olive oil in a food processor',
          ),
          Instruction(
            'Blend on high for 30 seconds',
          ),
          Instruction(
            'Stir in oregano',
          ),
        ],
        images: [
          await loadImageBase64('pizza-sauce-1.jpg'),
          await loadImageBase64('pizza-sauce-2.jpg'),
        ],
      ),
    ];

Future<String> loadImageBase64(String imageDir) async {
  var byteData = await rootBundle.load('assets/images/$imageDir');
  return base64Encode(byteData.buffer.asUint8List());
}
