import 'package:cookbook/components/meal_type_pill.dart';
import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../model/meal_type.dart';

class MealTypeFilter extends StatelessWidget {
  const MealTypeFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ViewConstants.buttonHeight,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        children: const [
          MealTypePill(
            mealType: MealType.breakfast,
            icon: Icons.breakfast_dining,
            color: Colors.amber,
          ),
          MealTypePill(
            mealType: MealType.lunch,
            icon: Icons.lunch_dining,
            color: Colors.deepOrange,
          ),
          MealTypePill(
            mealType: MealType.dinner,
            icon: Icons.dinner_dining,
            color: Colors.indigo,
          ),
          MealTypePill(
            mealType: MealType.dessert,
            icon: Icons.icecream,
            color: Colors.pink,
          ),
          MealTypePill(
            mealType: MealType.snack,
            icon: Icons.cookie,
            color: Colors.green,
          ),
          MealTypePill(
            mealType: MealType.drink,
            icon: Icons.liquor,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}