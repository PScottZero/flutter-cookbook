import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import 'image_index_indicator.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> images;

  const ImageCarousel({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: ViewConstants.imageCarouselHeight,
        viewportFraction: ViewConstants.imageCarouselViewportFraction,
        aspectRatio: ViewConstants.imageAspectRatio,
      ),
      items: <Widget>[
        for (int index = 0; index < images.length; index++)
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.memory(base64Decode(images[index])).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ImageIndexIndicator(
                index: index + 1,
                maxIndex: images.length,
              ),
            ],
          ),
      ],
    );
  }
}
