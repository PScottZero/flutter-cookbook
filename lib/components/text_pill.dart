import 'package:cookbook/components/rounded_container.dart';
import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class TextPill extends StatelessWidget {
  final String text;

  const TextPill({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: ViewConstants.smallFont,
        ),
      ),
    );
  }
}
