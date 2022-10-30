import 'package:flutter/widgets.dart';
import '../../features/login/login.dart';
import '../../home/home.dart';
import '../app.dart';

/// Auth flow pages according to authentication state
List<Page<void>> onGenerateAuthViewPages(
  AuthState state,
  List<Page<dynamic>> pages,
) {
  switch (state.status) {
    case AuthStatus.unauthenticated:
      return [Login.page()];
    case AuthStatus.authenticated:
      return [MyHomePage.page()];
  }
}
