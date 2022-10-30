import 'package:flutter/material.dart';

/// {@template google_login_button}
/// Google login button widget
/// Displays a 'Sign In With Google' Button
/// {@endtemplate google_login_button}
class GoogleLoginButton extends StatelessWidget {
  /// {@macro google_login_button}
  const GoogleLoginButton({
    required this.label,
    required this.onPressed,
    required this.icon,
    super.key,
  });

  /// Internationalizaed label
  final String label;

  /// On pressed callback
  final VoidCallback onPressed;

  /// Google icon
  final Image icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      key: key,
      onTap: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          color: theme.brightness == Brightness.light
              ? const Color(0xFF397AF3)
              : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 5,
              ),
              Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : Colors.black,
                  // fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
