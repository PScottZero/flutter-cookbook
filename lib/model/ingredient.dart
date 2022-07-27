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

  Ingredient.subRecipe()
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
        recipeId: recipeId,
      );

  bool amountIsPlural(String amount) {
    var wholeNumber = RegExp(r'\d+');
    var fraction = RegExp(r'\d+/\d+');
    var mixedFraction = RegExp(r'\d+ \d+/\d+');

    var isPluralUnit = unit != Unit.oz &&
        unit != Unit.ml &&
        unit != Unit.g &&
        unit != Unit.custom;

    if (mixedFraction.hasMatch(amount)) {
      return isPluralUnit;
    } else if (fraction.hasMatch(amount)) {
      return false;
    } else if (wholeNumber.hasMatch(amount)) {
      return amount != '1' && isPluralUnit;
    }
    return false;
  }

  @override
  String toString() {
    if (unit != Unit.none) {
      var unitStr = capitalize(unit == Unit.custom ? customUnit : unit.name);
      return amountIsPlural(amount)
          ? '$amount ${unitStr}s of ${capitalizeAllWords(name)}'
          : '$amount $unitStr of ${capitalizeAllWords(name)}';
    } else {
      return amountIsPlural(amount) ? '$amount ${name}s' : '$amount $name';
    }
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
