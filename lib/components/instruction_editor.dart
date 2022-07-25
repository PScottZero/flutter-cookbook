import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../model/instruction.dart';
import 'rounded_button.dart';
import 'rounded_container.dart';

class InstructionEditor extends StatefulWidget {
  final Instruction instruction;
  final MaterialColor color;
  final Function() delete;

  const InstructionEditor({
    Key? key,
    required this.instruction,
    required this.color,
    required this.delete,
  }) : super(key: key);

  @override
  State<InstructionEditor> createState() => _InstructionEditorState();
}

class _InstructionEditorState extends State<InstructionEditor> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.instruction.value;
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
              hintText: 'Enter an instruction',
            ),
            onChanged: (value) => widget.instruction.value = value,
          ),
          const SizedBox(height: ViewConstants.smallPadding),
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
