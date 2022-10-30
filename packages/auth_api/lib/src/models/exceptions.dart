/// {@template auth_exception}
class AuthException implements Exception {}

/// {@template login_failure}
/// Possible failures when trying to login
/// {@endtemplate}
enum LoginFailure {
  /// Unknown failure
  unknown,

  /// Tried to login with an invalid email or password
  invalidPassword,

  /// The user was not found
  userNotFound,
}

/// {@template login_exception}
/// Excetions thrown when login fails
/// {@endtemplate}
class LoginException extends AuthException {
  /// {@macro login_exception}
  LoginException(this.failure);

  /// Failure thrown
  final LoginFailure failure;
}

/// {@template signup_failure}
/// Possible failures when trying to register
/// {@endtemplate}
enum SignupFailure {
  /// Unknown failure
  unknown,

  /// Tried to login with an invalid email or password
  userAlreadyExists,
}

/// {@template signup_exception}
/// Excetions thrown when login fails
/// {@endtemplate}
class SignupException extends AuthException {
  /// {@macro signup_exception}
  SignupException(this.failure);

  /// Failure thrown
  final SignupFailure failure;
}

/// {template logout_exception}
/// Exception thrown when logout fails
/// {@endtemplate}
class LogoutException extends AuthException {}
