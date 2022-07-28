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
              left: ViewConstants.smallPadding,
              right: ViewConstants.smallPadding,
            ),
            child: TextButton(
              onPressed: toggleSelected,
              style: ButtonStyle(
                padding: msp(const EdgeInsets.all(ViewConstants.mediumPadding)),
                backgroundColor: msp(color.shade300),
                side: msp(
                  BorderSide(
                    color: toggleSelected != null && isSelected
                        ? color.shade700
                        : color.shade300,
                    width: ViewConstants.highlightedBorderWidth,
                  ),
                ),
                shape: msp(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      ViewConstants.maxBorderRadius,
                    ),
                  ),
                ),
              ),
              child: SizedBox(
                height: ViewConstants.mealTypePillHeight,
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: color.shade50,
                      size: ViewConstants.mealTypeIconSize,
                    ),
                    const SizedBox(width: ViewConstants.smallPadding),
                    Text(
                      mealTypeString,
                      style: TextStyle(
                        color: color.shade50,
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
