import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class ConfirmCancelDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmAction;
  final VoidCallback onConfirmed;
  final Color backgroundColor;

  const ConfirmCancelDialog({
    required this.title,
    required this.message,
    required this.confirmAction,
    required this.onConfirmed,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          ViewConstants.largeBorderRadius,
        ),
      ),
      title: Text(title),
      content: Text(
        message,
        style: const TextStyle(height: 2),
      ),
      actions: [
        TextButton(
          onPressed: onConfirmed,
          child: Text(
            confirmAction,
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
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
