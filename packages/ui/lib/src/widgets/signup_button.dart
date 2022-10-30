import 'package:flutter/material.dart';

/// {@template sign_up_button}
/// Signup button widget
/// {@endtemplate}
class SignUpButton extends StatelessWidget {
  /// {@macro sign_up_button}
  const SignUpButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  /// Internationalized label
  final String label;

  /// On pressed callback
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      key: key,
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: theme.primaryColor),
      ),
    );
  }
}
