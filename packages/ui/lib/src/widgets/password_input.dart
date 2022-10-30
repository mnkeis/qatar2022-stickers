import 'package:flutter/material.dart';

/// {@template password_input}
/// Password input field widget
/// Displays a password input field
/// {@endtemplate}
class PasswordInput extends StatefulWidget {
  /// {@macro password_input}
  const PasswordInput({
    required this.onChanged,
    this.labelText,
    this.helperText,
    this.errorText,
    super.key,
  });

  /// label text
  final String? labelText;

  /// Helper text
  final String? helperText;

  /// Error text
  final String? errorText;

  /// On changed callback
  final void Function(String) onChanged;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: widget.key,
      onChanged: widget.onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        helperText: widget.helperText,
        errorText: widget.errorText,
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () => setState(() {
            obscureText = !obscureText;
          }),
        ),
      ),
    );
  }
}
