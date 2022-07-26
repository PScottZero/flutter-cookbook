import 'package:flutter/material.dart';

import '../constants/functions.dart';
import '../constants/view_constants.dart';
import '../model/meal_type.dart';

class MealTypePill extends StatelessWidget {
  final MealType mealType;
  final IconData icon;
  final MaterialColor color;
  final bool isSelected;
  final Function()? toggleSelected;

  String get mealTypeString {
    var string = mealType.name;
    return mealType == MealType.snack || mealType == MealType.drink
        ? '${capitalize(string)}s'
        : capitalize(string);
  }

  bool get shouldShow => toggleSelected != null || isSelected;

  const MealTypePill({
    Key? key,
    required this.mealType,
    required this.icon,
    required this.color,
    required this.isSelected,
    this.toggleSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return toggleSelected != null || isSelected
        ? Container(
            padding: const EdgeInsets.only(
              left: ViewConstants.smallPadding / 2,
              right: ViewConstants.smallPadding / 2,
            ),
            child: TextButton(
              onPressed: toggleSelected,
              style: ButtonStyle(
                padding: msp(const EdgeInsets.all(ViewConstants.smallPadding)),
                backgroundColor: msp(color[300]),
                side: msp(
                  BorderSide(
                    color: color[
                        toggleSelected != null && isSelected ? 700 : 300]!,
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
                        fontSize: ViewConstants.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
