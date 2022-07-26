import 'package:json_annotation/json_annotation.dart';

import '../constants/functions.dart';
import 'unit.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  String name;
  String amount;
  Unit unit;
  String customUnit;
  String? recipeId;

  Ingredient({
    required this.name,
    required this.amount,
    this.unit = Unit.none,
    this.customUnit = '',
    this.recipeId,
  });

  Ingredient.empty() : this(name: '', amount: '');

  Ingredient.linkedRecipe()
      : this(
          name: '',
          amount: '',
          recipeId: '',
        );

  Ingredient clone() => Ingredient(
        name: name,
        amount: amount,
        unit: unit,
        customUnit: customUnit,
      );

  @override
  String toString() {
    if (unit != Unit.none) {
      var plural = amount != '1' &&
          unit != Unit.oz &&
          unit != Unit.ml &&
          unit != Unit.g &&
          unit != Unit.custom;
      var unitStr = unit == Unit.custom ? customUnit : unit.name;
      return plural
          ? '$amount ${unitStr}s of ${capitalizeAllWords(name)}'
          : '$amount $unitStr of ${capitalizeAllWords(name)}';
    } else {
      var plural = amount != '1';
      return plural ? '$amount ${name}s' : '$amount $name';
    }
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
