import 'package:json_annotation/json_annotation.dart';

import 'unit.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  String name;
  String amount;
  Unit unit;
  String customUnit;

  Ingredient({
    required this.name,
    required this.amount,
    this.unit = Unit.none,
    this.customUnit = '',
  });

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
          ? '$amount ${unitStr}s of $name'
          : '$amount $unitStr of $name';
    } else {
      var plural = amount != '1';
      return plural ? '$amount ${name}s' : '$amount $name';
    }
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
