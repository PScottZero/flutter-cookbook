import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class ImageIndexIndicator extends StatelessWidget {
  final int index;
  final int maxIndex;

  const ImageIndexIndicator({
    Key? key,
    required this.index,
    required this.maxIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ViewConstants.smallPadding),
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          ViewConstants.smallPadding,
          4,
          ViewConstants.smallPadding,
          4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ViewConstants.imageTextBackgroundColor,
        ),
        child: Text(
          '$index of $maxIndex',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
