import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/app_model.dart';
import 'rounded_button.dart';

class MoveDelete extends StatelessWidget {
  final bool isIngredient;
  final MaterialColor color;
  final Function() moveUp;
  final Function() moveDown;
  final Function() delete;

  const MoveDelete({
    Key? key,
    required this.isIngredient,
    required this.color,
    required this.moveUp,
    required this.moveDown,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => Row(
        children: [
          RoundedButton(
            icon: Icons.arrow_upward,
            color: color,
            isLarge: false,
            onPressed: () => moveUp(),
          ),
          RoundedButton(
            icon: Icons.arrow_downward,
            color: color,
            isLarge: false,
            onPressed: () => moveDown(),
          ),
          RoundedButton(
            icon: Icons.delete,
            color: Colors.red,
            isLarge: false,
            onPressed: () => delete(),
          ),
        ],
      ),
    );
  }
}
