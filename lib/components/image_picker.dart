import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' as picker;

import '../constants/view_constants.dart';
import 'rounded_button.dart';

class ImagePicker extends StatefulWidget {
  final List<String> images;
  final Function(String) addImage;
  final MaterialColor color;

  const ImagePicker({
    Key? key,
    required this.images,
    required this.addImage,
    required this.color,
  }) : super(key: key);

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  void _addImage() async {
    var image = await picker.ImagePicker()
        .pickImage(source: picker.ImageSource.gallery);
    if (image != null) {
      var base64 = base64Encode(await image.readAsBytes());
      setState(() {
        widget.images.add(base64);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        viewportFraction: 1.0,
        aspectRatio: 1,
      ),
      items: widget.images
              .map(
                (image) => Image.memory(
                  base64Decode(image),
                  fit: BoxFit.cover,
                ),
              )
              .toList()
              .cast<Widget>() +
          [
            Padding(
              padding: const EdgeInsets.only(top: ViewConstants.smallPadding),
              child: RoundedButton(
                text: 'Add Image',
                color: widget.color,
                onPressed: _addImage,
                padding: true,
              ),
            ),
          ],
    );
  }
}
