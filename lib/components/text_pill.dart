import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import 'rounded_container.dart';

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
