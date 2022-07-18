import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import 'item_pill.dart';

class ItemList extends StatelessWidget {
  final String title;
  final List items;
  final Color primaryColor;
  final Color accentColor;

  const ItemList({
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
      children: items.map((item) => ItemPill(item: item)).toList(),
    );
  }
}
