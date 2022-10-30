import 'package:flutter/material.dart';

/// {@template login_button}
/// Login button widget
/// Displays a Login button
/// {@endtemplate}
class SubmitButton extends StatelessWidget {
  /// {@macro login_button}
  const SubmitButton({
    required this.label,
    this.onPressed,
    super.key,
  });

  /// display label
  final String label;

  /// On pressed callback
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ), backgroundColor: const Color(0xFFFFD600),
        minimumSize: const Size(200, 50),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
