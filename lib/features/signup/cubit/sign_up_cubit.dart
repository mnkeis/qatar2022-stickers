import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'sign_up_state.dart';

/// Signup state
class SignupCubit extends Cubit<SignupState> {
  /// Default constructor
  SignupCubit(this._authRepository) : super(const SignupState());

  final AuthRepository _authRepository;

  /// User name changed, emits new state with a new name [value]
  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(
      state.copyWith(
        name: name,
        status: Formz.validate([
          name,
          state.email,
          state.password,
          state.confirmedPassword,
        ]),
      ),
    );
  }

  /// User email changed, emits new state with a new email [value]
  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([
          email,
          state.name,
          state.password,
          state.confirmedPassword,
        ]),
      ),
    );
  }

  /// User password changed, emits new state with a new password [value]
  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
        status: Formz.validate([
          state.name,
          state.email,
          password,
          confirmedPassword,
        ]),
      ),
    );
  }

  /// User confirmedPassword changed,
  /// emits new state with a new confirmedPassword [value]
  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
        status: Formz.validate([
          state.name,
          state.email,
          state.password,
          confirmedPassword,
        ]),
      ),
    );
  }

  /// Form has been submitted, call signup on auth repository
  Future<void> signUpFormSubmitted() async {
    // ignore: always_put_control_body_on_new_line
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await _authRepository.createUserWithEmailAndPassword(
      email: state.email.value,
      password: state.password.value,
      name: state.name.value,
    );
    result.fold(
      (f) => emit(
        state.copyWith(
          exception: f,
          status: FormzStatus.submissionFailure,
        ),
      ),
      (_) => emit(state.copyWith(status: FormzStatus.submissionSuccess)),
    );
  }
}
