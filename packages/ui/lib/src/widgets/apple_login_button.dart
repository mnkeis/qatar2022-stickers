import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// {@template apple_login_button}
/// Apple login button widget
/// Displays a 'Login with Apple' button only if available
/// If not, resturns an empty container
/// {@endtemplate}
class AppleLoginButton extends StatelessWidget {
  /// {@macro apple_login_button}
  const AppleLoginButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  /// Internationalizaed label
  final String label;

  /// On pressed callback
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: SignInWithApple.isAvailable(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.data ?? false) {
          return SignInWithAppleButton(
            key: key,
            text: label,
            onPressed: onPressed,
          );
        }
        return Container();
      },
    );
  }
}
