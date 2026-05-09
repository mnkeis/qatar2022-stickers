import 'package:flutter/material.dart';
import 'package:qatar2022_stickers/l10n/l10n.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    required this.message,
    this.child,
    super.key,
  });

  final String message;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message),
      actions: [
        if (child != null) child!,
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(context.l10n.okButtonText),
        ),
      ],
    );
  }
}
