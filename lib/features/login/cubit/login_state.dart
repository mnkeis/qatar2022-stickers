part of 'login_cubit.dart';

/// Login form states
class LoginState extends Equatable {
  /// Login state with [email], [password], [status] and [exception]
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.formValid = false,
    this.status = FormzSubmissionStatus.initial,
    this.exception,
  });

  /// User email
  final Email email;

  /// User password
  final Password password;

  /// From validation status
  final bool formValid;

  /// Submission status
  final FormzSubmissionStatus status;

  /// Authentication failure
  final LoginException? exception;

  @override
  List<Object> get props => [email, password, formValid, status];

  /// Creates a copy of this instance with some modified members
  LoginState copyWith({
    Email? email,
    Password? password,
    bool? formValid,
    FormzSubmissionStatus? status,
    LoginException? exception,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formValid: formValid ?? this.formValid,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }
}
