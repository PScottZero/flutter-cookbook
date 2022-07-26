import 'package:cookbook/components/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../model/instruction.dart';
import 'rounded_button.dart';
import 'rounded_container.dart';

class EditInstruction extends StatefulWidget {
  final Instruction instruction;
  final MaterialColor color;
  final Function() delete;

  const EditInstruction({
    Key? key,
    required this.instruction,
    required this.color,
    required this.delete,
  }) : super(key: key);

  @override
  State<EditInstruction> createState() => _EditInstructionState();
}

class _EditInstructionState extends State<EditInstruction> {
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
          CustomTextField(
            text: widget.instruction.value,
            onChanged: (value) => widget.instruction.value = value,
            capitalization: TextCapitalization.sentences,
            maxLines: 5,
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
