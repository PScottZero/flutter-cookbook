import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/functions.dart';
import '../constants/view_constants.dart';
import '../model/app_model.dart';
import '../model/meal_type.dart';

class MealTypePill extends StatelessWidget {
  final MealType mealType;
  final IconData icon;
  final MaterialColor color;

  String get mealTypeString {
    var string = mealType.name;
    return mealType == MealType.snack || mealType == MealType.drink
        ? '${capitalize(string)}s'
        : capitalize(string);
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
      builder: (context, model, child) => Container(
        padding: const EdgeInsets.all(ViewConstants.smallPadding / 2),
        child: TextButton(
          onPressed: () => model.toggleMealTypeFilter(mealType),
          style: ButtonStyle(
            padding: msp(const EdgeInsets.all(ViewConstants.smallPadding)),
            backgroundColor: msp(color[300]),
            side: msp(
              BorderSide(
                color: color[model.mealTypeIsSelected(mealType) ? 700 : 300]!,
                width: 3,
              ),
            ),
            shape: msp(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          child: SizedBox(
            height: 60,
            child: Row(
              children: [
                Icon(icon, color: color[50], size: 18),
                const SizedBox(width: 5),
                Text(
                  mealTypeString,
                  style: TextStyle(
                    color: color[50],
                    fontSize: ViewConstants.smallFont,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
