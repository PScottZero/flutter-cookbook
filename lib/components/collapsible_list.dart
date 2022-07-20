import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class CollapsibleList extends StatelessWidget {
  final String title;
  final List<Widget> items;
  final Color primaryColor;
  final Color accentColor;

  const CollapsibleList({
    Key? key,
    required this.title,
    required this.items,
    required this.primaryColor,
    required this.accentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: ViewConstants.largeFont,
        ),
      ),
      initiallyExpanded: true,
      textColor: primaryColor,
      iconColor: primaryColor,
      collapsedTextColor: accentColor,
      collapsedIconColor: accentColor,
      collapsedBackgroundColor: primaryColor,
      children: items,
    );
  }
}
