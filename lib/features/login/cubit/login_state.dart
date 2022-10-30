part of 'login_cubit.dart';

/// Login form states
@immutable
class LoginState extends Equatable {
  /// Login state with [email], [password], [status] and [exception]
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.exception,
  });

  /// User email
  final Email email;

  /// User password
  final Password password;

  /// Form status
  final FormzStatus status;

  /// Authentication failure
  final LoginException? exception;

  @override
  List<Object> get props => [email, password, status];

  /// Creates a copy of this instance with some modified members
  LoginState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    LoginException? exception,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }
}
