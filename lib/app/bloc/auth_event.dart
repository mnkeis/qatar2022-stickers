part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthStateChanged extends AuthEvent {
  AuthStateChanged(this.user);

  final User user;
}

class LogoutRequested extends AuthEvent {}
