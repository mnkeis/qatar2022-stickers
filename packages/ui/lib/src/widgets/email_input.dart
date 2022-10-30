import 'package:flutter/material.dart';

/// {@template email_input}
/// Email input field widget
/// Displays an email input field
/// {@endtemplate}
class EmailInput extends StatelessWidget {
  /// {@macro email_input}
  const EmailInput({
    required this.onChanged,
    this.labelText,
    this.helperText,
    this.errorText,
    super.key,
  });

  /// Hint text
  final String? labelText;

  /// Helper text
  final String? helperText;

  /// Error text
  final String? errorText;

  /// On changed callback
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: labelText,
        helperText: helperText,
        errorText: errorText,
      ),
    );
  }
}
