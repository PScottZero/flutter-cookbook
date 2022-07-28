import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import '../model/app_theme.dart';
import '../model/instruction.dart';
import 'custom_text_field.dart';
import 'rounded_button.dart';
import 'rounded_container.dart';

class EditInstruction extends StatelessWidget {
  final Instruction instruction;
  final AppTheme theme;
  final Function() delete;

  const EditInstruction({
    Key? key,
    required this.instruction,
    required this.theme,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      child: Column(
        children: [
          CustomTextField(
            text: instruction.value,
            onChanged: (value) => instruction.value = value,
            capitalization: TextCapitalization.sentences,
            maxLines: ViewConstants.textFieldMaxLines,
          ),
          const SizedBox(height: ViewConstants.mediumPadding),
          RoundedButton(
            icon: Icons.delete,
            theme: theme,
            onPressed: delete,
          ),
        ],
      ),
    );
  }
}
