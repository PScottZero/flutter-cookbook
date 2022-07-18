import 'package:cookbook/components/item_pill.dart';
import 'package:cookbook/constants/view_constants.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final String title;
  final List items;

  const ItemList({
    Key? key,
    required this.title,
    required this.items,
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
      collapsedTextColor: Colors.white,
      collapsedIconColor: Colors.white,
      collapsedBackgroundColor: ViewConstants.primaryColor,
      children: items.map((item) => ItemPill(item: item)).toList(),
    );
  }
}
