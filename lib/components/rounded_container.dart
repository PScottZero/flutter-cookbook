import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final bool padding;
  final bool margin;

  const RoundedContainer({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.padding = true,
    this.margin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ? const EdgeInsets.all(ViewConstants.largePadding) : null,
      margin: margin
          ? const EdgeInsets.all(ViewConstants.mediumPadding)
          : const EdgeInsets.only(bottom: ViewConstants.mediumPadding),
      width: MediaQuery.of(context).size.width - ViewConstants.largePadding,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ViewConstants.largeBorderRadius,
        ),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
