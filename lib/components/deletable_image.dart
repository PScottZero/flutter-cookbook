import 'dart:convert';

import 'package:cookbook/constants/view_constants.dart';
import 'package:flutter/material.dart';

class DeletableImage extends StatelessWidget {
  final String image;
  final Function(int) delete;

  const DeletableImage({
    Key? key,
    required this.image,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: ViewConstants.smallPadding / 2,
        right: ViewConstants.smallPadding / 2,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.memory(base64Decode(image)).image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(
                  ViewConstants.largeBorderRadius,
                ),
              ),
            ),
            IconButton(
              color: Colors.white,
              onPressed: () => delete((key as ValueKey).value),
              icon: const Icon(
                Icons.delete,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
