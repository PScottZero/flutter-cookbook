import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import 'rounded_container.dart';

class InstructionPill extends StatelessWidget {
  final String text;

  const InstructionPill({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: ViewConstants.fontSize,
        ),
      ),
    );
  }
}
