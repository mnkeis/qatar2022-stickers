import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

/// Login form state manager
class LoginCubit extends Cubit<LoginState> {
  /// Login form state manager
  LoginCubit(this._authRepository) : super(const LoginState());

  final AuthRepository _authRepository;

  /// User email has changed, emits a new state with the modified email [value]
  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  /// User password has changed,
  /// emits a new state with the modified password [value]
  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  /// Login with email and password button has been pressed,
  /// start the login flow
  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated) {
      return;
    }
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await _authRepository.loginWithEmailAndPassword(
      email: state.email.value,
      password: state.password.value,
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

  /// Login with google button has been pressed,
  /// start the login flow
  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await _authRepository.loginWithGoogle();
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

  /// Login with apple button has been pressed,
  /// start the login flow
  Future<void> logInWithApple() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    // final result = await _authRepository.logInWithApple();
    // result.fold(
    //   (f) => emit(
    //     state.copyWith(
    //       failure: f,
    //       status: FormzStatus.submissionFailure,
    //     ),
    //   ),
    //   (_) => emit(state.copyWith(status: FormzStatus.submissionSuccess)),
    // );
  }
}
