import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> images;

  const ImageCarousel({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        viewportFraction: 1.0,
        aspectRatio: 1,
      ),
      items: images
          .map(
            (image) => Image.memory(
              base64Decode(image),
              fit: BoxFit.cover,
            ),
          )
          .toList(),
    );
  }
}
