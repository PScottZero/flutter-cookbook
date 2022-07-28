import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../model/meal_type.dart';
import 'meal_type_pill.dart';

class MealTypes extends StatelessWidget {
  final List<MealType> selectedMealTypes;
  final Function(MealType)? toggleMealType;
  final bool editable;

  const MealTypes({
    Key? key,
    required this.selectedMealTypes,
    this.toggleMealType,
    this.editable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ViewConstants.buttonHeight,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
          left: ViewConstants.smallPadding,
          right: ViewConstants.smallPadding,
        ),
        children: [
          MealTypePill(
            mealType: MealType.breakfast,
            icon: Icons.breakfast_dining,
            color: Colors.amber,
            isSelected: selectedMealTypes.contains(MealType.breakfast),
            toggleSelected:
                editable ? () => toggleMealType!(MealType.breakfast) : null,
          ),
          MealTypePill(
            mealType: MealType.lunch,
            icon: Icons.lunch_dining,
            color: Colors.deepOrange,
            isSelected: selectedMealTypes.contains(MealType.lunch),
            toggleSelected:
                editable ? () => toggleMealType!(MealType.lunch) : null,
          ),
          MealTypePill(
            mealType: MealType.dinner,
            icon: Icons.dinner_dining,
            color: Colors.indigo,
            isSelected: selectedMealTypes.contains(MealType.dinner),
            toggleSelected:
                editable ? () => toggleMealType!(MealType.dinner) : null,
          ),
          MealTypePill(
            mealType: MealType.dessert,
            icon: Icons.icecream,
            color: Colors.pink,
            isSelected: selectedMealTypes.contains(MealType.dessert),
            toggleSelected:
                editable ? () => toggleMealType!(MealType.dessert) : null,
          ),
          MealTypePill(
            mealType: MealType.snack,
            icon: Icons.cookie,
            color: Colors.green,
            isSelected: selectedMealTypes.contains(MealType.snack),
            toggleSelected:
                editable ? () => toggleMealType!(MealType.snack) : null,
          ),
          MealTypePill(
            mealType: MealType.drink,
            icon: Icons.liquor,
            color: Colors.blue,
            isSelected: selectedMealTypes.contains(MealType.drink),
            toggleSelected:
                editable ? () => toggleMealType!(MealType.drink) : null,
          ),
        ],
      ),
    );
  }
}
