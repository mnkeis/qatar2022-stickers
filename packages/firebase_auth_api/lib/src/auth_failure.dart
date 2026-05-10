import 'package:auth_api/auth_api.dart';

/// {@template firebase_auth_login_exception}
/// Exception thrown when a firebase login fails
/// {@endtemplate}
class FirebaseAuthLoginException extends LoginException {
  FirebaseAuthLoginException._(super.failure);

  /// Builds exception from firebase exception code
  factory FirebaseAuthLoginException.fromFirebaseAuthException(String e) {
    switch (e) {
      case 'wrong-password':
        return FirebaseAuthLoginException._(LoginFailure.invalidPassword);
      case 'user-not-found':
        return FirebaseAuthLoginException._(LoginFailure.userNotFound);
      default:
        return FirebaseAuthLoginException._(LoginFailure.unknown);
    }
  }
}

/// {@template firebase_auth_signup_exception}
/// Exception thrown when a firebase signup fails
/// {@endtemplate}
class FirebaseAuthSignupException extends SignupException {
  FirebaseAuthSignupException._(super.failure);

  /// Builds exception from firebase exception code
  factory FirebaseAuthSignupException.fromFirebaseAuthException(String e) {
    switch (e) {
      case 'email-already-in-use':
        return FirebaseAuthSignupException._(SignupFailure.userAlreadyExists);
      default:
        return FirebaseAuthSignupException._(SignupFailure.unknown);
    }
  }
}
