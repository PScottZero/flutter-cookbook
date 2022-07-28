import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/view_constants.dart';
import '../model/app_theme.dart';
import '../model/ingredient.dart';
import '../model/unit.dart';
import 'custom_text_field.dart';
import 'rounded_button.dart';
import 'rounded_container.dart';

class EditIngredient extends StatefulWidget {
  final Ingredient ingredient;
  final AppTheme theme;
  final Function() delete;

  const EditIngredient({
    Key? key,
    required this.ingredient,
    required this.theme,
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
          DropdownButtonFormField<Unit>(
            value: widget.ingredient.unit,
            isExpanded: true,
            onChanged: (unit) => setState(
              () => widget.ingredient.unit = unit ?? Unit.none,
            ),
            style: GoogleFonts.comfortaa(
              fontSize: ViewConstants.fontSize,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              labelText: 'Unit',
            ),
            items: Unit.values
                .map(
                  (unit) => DropdownMenuItem(
                    value: unit,
                    child: Text(unit.name),
                  ),
                )
                .toList(),
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
            theme: widget.theme,
            onPressed: widget.delete,
          ),
        ],
      ),
    );
  }
}
