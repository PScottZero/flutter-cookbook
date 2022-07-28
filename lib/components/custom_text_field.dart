import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class CustomTextField extends StatefulWidget {
  final Function(String) onChanged;
  final String text;
  final String? label;
  final int maxLines;
  final Color? textColor;
  final TextCapitalization capitalization;
  final bool plain;

  const CustomTextField({
    Key? key,
    required this.onChanged,
    this.text = '',
    this.label,
    this.maxLines = 1,
    this.textColor,
    this.capitalization = TextCapitalization.words,
    this.plain = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      textCapitalization: widget.capitalization,
      minLines: ViewConstants.textFieldMinLines,
      maxLines: widget.maxLines,
      cursorColor: widget.textColor,
      style: TextStyle(
        fontSize: ViewConstants.fontSize,
        color: widget.textColor,
      ),
      decoration: InputDecoration(
        border: widget.plain ? InputBorder.none : null,
        labelText: widget.label,
        hintText: widget.label != null
            ? 'Enter ${widget.label!.toLowerCase()}'
            : null,
      ),
      onChanged: widget.onChanged,
    );
  }
}
