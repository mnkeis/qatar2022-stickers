part of 'sign_up_cubit.dart';

/// Confirm password validation errors
enum ConfirmPasswordValidationError {
  /// Invalid, passwords don't match
  invalid,
}

/// Signup state
class SignupState extends Equatable {
  /// Default constructor
  const SignupState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.formValid = false,
    this.status = FormzSubmissionStatus.initial,
    this.exception,
  });

  /// User name
  final Name name;

  /// User email
  final Email email;

  /// User password
  final Password password;

  /// User confirmed password that should match user password
  final ConfirmedPassword confirmedPassword;

  /// From valid
  final bool formValid;

  /// Form Submission status
  final FormzSubmissionStatus status;

  /// Signup failure
  final SignupException? exception;

  @override
  List<Object> get props => [
        name,
        email,
        password,
        confirmedPassword,
        status,
      ];

  /// Create a copy of this instance with some modified members
  SignupState copyWith({
    Name? name,
    Email? email,
    Password? password,
    bool? maskPassword,
    ConfirmedPassword? confirmedPassword,
    bool? formValid,
    FormzSubmissionStatus? status,
    SignupException? exception,
  }) {
    return SignupState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      formValid: formValid ?? this.formValid,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }
}
