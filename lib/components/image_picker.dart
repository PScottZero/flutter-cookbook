import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart' as picker;
import 'package:reorderables/reorderables.dart';

import '../constants/view_constants.dart';
import '../model/app_theme.dart';
import 'deletable_image.dart';
import 'rounded_button.dart';

class ImagePicker extends StatefulWidget {
  final List<String> images;
  final Function(String) addImage;
  final Function(int) deleteImage;
  final AppTheme theme;

  const ImagePicker({
    Key? key,
    required this.images,
    required this.addImage,
    required this.deleteImage,
    required this.theme,
  }) : super(key: key);

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  void _addImage() async {
    var image = await picker.ImagePicker()
        .pickImage(source: picker.ImageSource.gallery);
    if (image != null) {
      var compressedImage = await FlutterImageCompress.compressWithFile(
        image.path,
        quality: 90,
      );
      if (compressedImage != null) {
        var base64 = base64Encode(compressedImage);
        setState(() => widget.images.add(base64));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
          left: ViewConstants.smallPadding / 2,
          top: ViewConstants.smallPadding,
          right: ViewConstants.smallPadding / 2,
          bottom: ViewConstants.smallPadding,
        ),
        children: [
          ReorderableRow(
            children: <Widget>[
              for (int index = 0; index < widget.images.length; index++)
                DeletableImage(
                  key: ValueKey(index),
                  image: widget.images[index],
                  delete: widget.deleteImage,
                ),
            ],
            onReorder: (oldIndex, newIndex) => setState(
              () => widget.images.insert(
                newIndex,
                widget.images.removeAt(oldIndex),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: ViewConstants.smallPadding / 2,
              right: ViewConstants.smallPadding / 2,
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: RoundedButton(
                text: 'Add Image',
                theme: widget.theme,
                onPressed: _addImage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
