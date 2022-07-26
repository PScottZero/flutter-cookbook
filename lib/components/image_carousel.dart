import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'image_index_indicator.dart';

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
                    filterQuality: FilterQuality.medium,
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
