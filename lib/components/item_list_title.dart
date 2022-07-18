import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class ItemListTitle extends StatelessWidget {
  final String title;

  const ItemListTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ViewConstants.primaryColor,
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
