import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository) : super(const AuthState.unauthenticated()) {
    _userStream = _authRepository.user.listen((user) {
      add(AuthStateChanged(user));
    });
    on<AuthStateChanged>((event, emit) {
      if (event.user == User.empty) {
        emit(const AuthState.unauthenticated());
      } else {
        emit(AuthState.authenticated(event.user));
      }
    });

    on<LogoutRequested>((event, emit) => _authRepository.logout());
  }

  late final StreamSubscription<User> _userStream;

  final AuthRepository _authRepository;

  @override
  Future<void> close() {
    _userStream.cancel();
    return super.close();
  }
}
