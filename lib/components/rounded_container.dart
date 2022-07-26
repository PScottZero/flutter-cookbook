import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final bool padding;
  final bool margin;

  const RoundedContainer({
    Key? key,
    required this.child,
    this.padding = true,
    this.margin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ? const EdgeInsets.all(ViewConstants.largePadding) : null,
      margin: margin
          ? const EdgeInsets.all(ViewConstants.smallPadding)
          : const EdgeInsets.only(bottom: ViewConstants.smallPadding),
      width: MediaQuery.of(context).size.width - ViewConstants.smallPadding * 2,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ViewConstants.largeBorderRadius,
        ),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
