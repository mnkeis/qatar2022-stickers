import 'package:flutter/material.dart';

/// {@template name_input}
/// Name input field widget
/// {@endtemplate}
class NameInput extends StatelessWidget {
  /// {@macro name_input}
  const NameInput({
    required this.onChanged,
    this.labelText,
    this.helperText,
    this.errorText,
    super.key,
  });

  /// Label text
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
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: labelText,
        helperText: helperText,
        errorText: errorText,
      ),
    );
  }
}
