import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final bool margin;

  const RoundedContainer({
    Key? key,
    required this.child,
    this.margin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ViewConstants.largePadding),
      margin: margin
          ? const EdgeInsets.all(ViewConstants.smallPadding)
          : const EdgeInsets.only(bottom: ViewConstants.smallPadding),
      width: MediaQuery.of(context).size.width - ViewConstants.smallPadding * 2,
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
