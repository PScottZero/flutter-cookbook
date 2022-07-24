import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../model/ingredient.dart';
import 'move_delete.dart';
import 'rounded_container.dart';

class IngredientEditor extends StatefulWidget {
  final Ingredient ingredient;
  final MaterialColor color;

  const IngredientEditor({
    Key? key,
    required this.ingredient,
    required this.color,
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
          const SizedBox(height: ViewConstants.smallPadding / 2),
          MoveDelete(
            index: (widget.key! as ValueKey).value,
            isIngredient: true,
            color: widget.color,
          ),
        ],
      ),
    );
  }
}
