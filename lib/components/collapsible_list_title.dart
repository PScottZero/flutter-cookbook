import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class CollapsibleListTitle extends StatelessWidget {
  final String title;
  final Color color;

  const CollapsibleListTitle({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(ViewConstants.largePadding),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: ViewConstants.largeFont,
          color: Colors.white,
        ),
      ),
    );
  }
}
