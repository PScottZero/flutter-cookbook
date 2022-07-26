import 'package:cookbook/components/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../model/ingredient.dart';
import '../model/unit.dart';
import 'rounded_button.dart';
import 'rounded_container.dart';
import 'unit_dropdown.dart';

class EditIngredient extends StatefulWidget {
  final Ingredient ingredient;
  final MaterialColor color;
  final Function() delete;

  const EditIngredient({
    Key? key,
    required this.ingredient,
    required this.color,
    required this.delete,
  }) : super(key: key);

  @override
  State<EditIngredient> createState() => _EditIngredientState();
}

class _EditIngredientState extends State<EditIngredient> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _amountEditingController =
      TextEditingController();
  final TextEditingController _customUnitEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameEditingController.text = widget.ingredient.name;
    _amountEditingController.text = widget.ingredient.amount;
    _customUnitEditingController.text = widget.ingredient.customUnit;
  }

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      child: Column(
        children: [
          CustomTextField(
            text: widget.ingredient.name,
            label: 'Ingredient',
            onChanged: (name) => widget.ingredient.name = name,
          ),
          const SizedBox(height: ViewConstants.smallPadding / 2),
          CustomTextField(
            text: widget.ingredient.amount,
            label: 'Amount',
            onChanged: (amount) => widget.ingredient.amount = amount,
          ),
          const SizedBox(height: ViewConstants.smallPadding),
          UnitDropdown(
            unit: widget.ingredient.unit,
            onChanged: (unit) => setState(
              () => widget.ingredient.unit = unit ?? Unit.none,
            ),
          ),
          const SizedBox(height: ViewConstants.smallPadding),
          widget.ingredient.unit == Unit.custom
              ? Column(
                  children: [
                    CustomTextField(
                      text: widget.ingredient.customUnit,
                      label: 'Custom Unit',
                      onChanged: (customUnit) =>
                          widget.ingredient.customUnit = customUnit,
                    ),
                    const SizedBox(height: ViewConstants.smallPadding),
                  ],
                )
              : Container(),
          RoundedButton(
            icon: Icons.delete,
            color: widget.color,
            onPressed: widget.delete,
          ),
        ],
      ),
    );
  }
}
