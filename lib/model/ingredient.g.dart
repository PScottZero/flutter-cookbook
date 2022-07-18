// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      name: json['name'] as String,
      amount: json['amount'] as String,
      unit: $enumDecodeNullable(_$UnitEnumMap, json['unit']) ?? Unit.none,
      customUnit: json['customUnit'] as String? ?? '',
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'unit': _$UnitEnumMap[instance.unit]!,
      'customUnit': instance.customUnit,
    };

const _$UnitEnumMap = {
  Unit.tsp: 'tsp',
  Unit.tbsp: 'tbsp',
  Unit.oz: 'oz',
  Unit.cup: 'cup',
  Unit.g: 'g',
  Unit.ml: 'ml',
  Unit.lb: 'lb',
  Unit.custom: 'custom',
  Unit.none: 'none',
};
