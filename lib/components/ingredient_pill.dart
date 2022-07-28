import 'package:flutter/material.dart';

import '../constants/functions.dart';
import '../constants/view_constants.dart';
import '../model/app_theme.dart';
import '../model/ingredient.dart';
import 'rounded_container.dart';

class IngredientPill extends StatelessWidget {
  final Ingredient ingredient;
  final AppTheme theme;

  const IngredientPill({
    Key? key,
    required this.ingredient,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: theme.accentColor2,
      padding: false,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: ViewConstants.smallPadding,
                right: ViewConstants.smallPadding,
              ),
              child: Text(
                ingredient.amountString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: ViewConstants.fontSize,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(
                ViewConstants.smallPadding,
                ViewConstants.largePadding,
                ViewConstants.smallPadding,
                ViewConstants.largePadding,
              ),
              child: Text(
                capitalizeAllWords(ingredient.name),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: ViewConstants.fontSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
