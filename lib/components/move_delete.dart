import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/app_model.dart';
import 'rounded_button.dart';

class MoveDelete extends StatefulWidget {
  final int index;
  final bool isIngredient;
  final MaterialColor color;

  const MoveDelete({
    Key? key,
    required this.index,
    required this.isIngredient,
    required this.color,
  }) : super(key: key);

  @override
  State<MoveDelete> createState() => _MoveDeleteState();
}

class _MoveDeleteState extends State<MoveDelete> {
  AppModel? _model;

  void moveUp() {
    if (_model != null) {
      swap(getList(widget.isIngredient), widget.index, widget.index - 1);
      _model!.refresh();
    }
  }

  void moveDown() {
    if (_model != null) {
      swap(getList(widget.isIngredient), widget.index, widget.index + 1);
      _model?.refresh();
    }
  }

  void delete() {
    if (_model != null) {
      getList(widget.isIngredient).removeAt(widget.index);
      _model?.refresh();
    }
  }

  List getList(bool isIngredient) => isIngredient
      ? _model!.selectedRecipe!.ingredients
      : _model!.selectedRecipe!.instructions;

  void swap(List list, int index1, int index2) {
    if (index2 >= 0 && index2 < list.length) {
      var temp = list[index1];
      list[index1] = list[index2];
      list[index2] = temp;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) {
        _model = model;
        return Row(
          children: [
            RoundedButton(
              icon: Icons.arrow_upward,
              color: widget.color,
              isLarge: false,
              onPressed: moveUp,
            ),
            RoundedButton(
              icon: Icons.arrow_downward,
              color: widget.color,
              isLarge: false,
              onPressed: moveDown,
            ),
            RoundedButton(
              icon: Icons.delete,
              color: Colors.red,
              isLarge: false,
              onPressed: delete,
            ),
          ],
        );
      },
    );
  }
}
