part of 'auth_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

@immutable
class AuthState extends Equatable {
  const AuthState._({
    required this.status,
    this.user = User.empty,
  });

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  const AuthState.authenticated(User user)
      : this._(status: AuthStatus.authenticated, user: user);

  final AuthStatus status;
  final User user;

  @override
  List<Object?> get props => [status, user];
}
