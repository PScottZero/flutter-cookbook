import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class EditableInstructionPill extends StatelessWidget {
  const EditableInstructionPill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ViewConstants.largePadding),
      margin: const EdgeInsets.only(bottom: ViewConstants.smallPadding),
      width: MediaQuery.of(context).size.width - ViewConstants.smallPadding * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ViewConstants.largeBorderRadius,
        ),
        color: Colors.white,
      ),
      child: Text(
        '$item',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: ViewConstants.smallFont,
        ),
      ),
    );
  }
}
