import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../model/ingredient.dart';
import '../model/unit.dart';
import 'rounded_button.dart';
import 'rounded_container.dart';
import 'unit_dropdown.dart';

class IngredientEditor extends StatefulWidget {
  final Ingredient ingredient;
  final MaterialColor color;
  final Function() delete;

  const IngredientEditor({
    Key? key,
    required this.ingredient,
    required this.color,
    required this.delete,
  }) : super(key: key);

  @override
  State<IngredientEditor> createState() => _IngredientEditorState();
}

class _IngredientEditorState extends State<IngredientEditor> {
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
          TextField(
            controller: _nameEditingController,
            onChanged: (name) => widget.ingredient.name = name,
            style: const TextStyle(fontSize: ViewConstants.smallFont),
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Ingredient',
              hintText: 'Enter an ingredient',
            ),
          ),
          const SizedBox(height: ViewConstants.smallPadding / 2),
          TextField(
            controller: _amountEditingController,
            onChanged: (amount) => widget.ingredient.amount = amount,
            style: const TextStyle(fontSize: ViewConstants.smallFont),
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Amount',
              hintText: 'Enter an amount',
            ),
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
                    TextField(
                      controller: _customUnitEditingController,
                      onChanged: (customUnit) => setState(
                        () => widget.ingredient.customUnit = customUnit,
                      ),
                      style: const TextStyle(fontSize: ViewConstants.smallFont),
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        labelText: 'Custom Unit',
                        hintText: 'Enter a custom unit',
                      ),
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
