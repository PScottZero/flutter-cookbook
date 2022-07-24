import 'package:cookbook/components/move_delete.dart';
import 'package:cookbook/components/rounded_container.dart';
import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class InstructionEditor extends StatefulWidget {
  final String initialValue;
  final MaterialColor color;

  const InstructionEditor({
    Key? key,
    required this.initialValue,
    required this.color,
  }) : super(key: key);

  @override
  State<InstructionEditor> createState() => _InstructionEditorState();
}

class _InstructionEditorState extends State<InstructionEditor> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      child: Column(
        children: [
          TextField(
            controller: _textEditingController,
            style: const TextStyle(fontSize: ViewConstants.smallFont),
            minLines: 1,
            maxLines: 5,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              hintText: 'Enter recipe step',
              // border: InputBorder.none,
            ),
          ),
          const SizedBox(height: ViewConstants.smallPadding / 2),
          MoveDelete(
            index: (widget.key! as ValueKey).value,
            isIngredient: false,
            color: widget.color,
          ),
        ],
      ),
    );
  }
}
