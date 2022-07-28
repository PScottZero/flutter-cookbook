import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class ConfirmCancelDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final Color backgroundColor;
  final VoidCallback onConfirmed;

  const ConfirmCancelDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.confirmText,
    required this.backgroundColor,
    required this.onConfirmed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          ViewConstants.largeBorderRadius,
        ),
      ),
      content: Text(
        message,
        style: const TextStyle(
          height: ViewConstants.dialogTextHeight,
        ),
      ),
      actions: [
        TextButton(
          onPressed: onConfirmed,
          child: Text(
            confirmText,
            style: const TextStyle(
              fontSize: ViewConstants.fontSize,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: ViewConstants.fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
