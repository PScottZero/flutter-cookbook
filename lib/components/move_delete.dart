import 'package:flutter/material.dart';

import '../model/move_delete_functions.dart';
import 'rounded_button.dart';

class MoveDelete extends StatelessWidget {
  final int index;
  final bool isIngredient;
  final MoveDeleteFunctions moveDeleteFunctions;
  final MaterialColor color;

  const MoveDelete({
    Key? key,
    required this.index,
    required this.isIngredient,
    required this.moveDeleteFunctions,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedButton(
          icon: Icons.arrow_upward,
          color: color,
          isLarge: false,
          onPressed: () => moveDeleteFunctions.moveUp(isIngredient, index),
        ),
        RoundedButton(
          icon: Icons.arrow_downward,
          color: color,
          isLarge: false,
          onPressed: () => moveDeleteFunctions.moveDown(isIngredient, index),
        ),
        RoundedButton(
          icon: Icons.delete,
          color: Colors.red,
          isLarge: false,
          onPressed: () => moveDeleteFunctions.delete(isIngredient, index),
        ),
      ],
    );
  }
}
