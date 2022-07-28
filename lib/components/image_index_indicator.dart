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
      padding: const EdgeInsets.all(ViewConstants.mediumPadding),
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          ViewConstants.mediumPadding,
          ViewConstants.imageIndexPadding,
          ViewConstants.mediumPadding,
          ViewConstants.imageIndexPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ViewConstants.maxBorderRadius),
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
