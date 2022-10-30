import 'package:formz/formz.dart';

/// Validation errors for the [Email] [FormzInput].
enum NameValidationError {
  /// Generic invalid error.
  isEmpty
}

/// {@template email}
/// Form input for a name field.
/// {@endtemplate}
class Name extends FormzInput<String, NameValidationError> {
  /// {@macro email}
  const Name.pure() : super.pure('');

  /// {@macro email}
  const Name.dirty([String value = '']) : super.dirty(value);

  static final RegExp _nameRegExp = RegExp(
    '[a-zA-Z].{1,}',
  );

  @override
  NameValidationError? validator(String? value) {
    return _nameRegExp.hasMatch(value ?? '')
        ? null
        : NameValidationError.isEmpty;
  }
}
