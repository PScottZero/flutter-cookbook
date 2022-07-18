import 'package:cookbook/constants/view_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/app_model.dart';
import '../model/meal_type.dart';

class MealTypePill extends StatelessWidget {
  final MealType mealType;
  final IconData icon;
  final MaterialColor color;

  String get mealTypeString {
    var string = mealType.name;
    return mealType == MealType.snack || mealType == MealType.drink
        ? '${string[0].toUpperCase()}${string.substring(1)}s'
        : '${string[0].toUpperCase()}${string.substring(1)}';
  }

  const MealTypePill({
    Key? key,
    required this.mealType,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => TextButton(
        onPressed: () => model.toggleMealTypeFilter(mealType),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: color[300],
            border: model.mealTypeIsSelected(mealType)
                ? Border.all(color: color[700]!, width: 3)
                : Border.all(color: color[300]!, width: 3),
          ),
          padding: const EdgeInsets.all(ViewConstants.smallPadding),
          child: Row(
            children: [
              Icon(icon, color: color[50], size: 18),
              const SizedBox(width: 5),
              Text(
                mealTypeString,
                style: TextStyle(color: color[50]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
