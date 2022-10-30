import 'package:auth_api/auth_api.dart';
import 'package:dartz/dartz.dart';

/// {@template auth_repository_repository}
/// Authentication provider
/// {@endtemplate}
class AuthRepository {
  /// {@macro auth_repository_repository}
  const AuthRepository(this._authApi);

  /// API interface for this repository
  final AuthApi _authApi;

  /// A stream that emits a new user when authentication changes
  Stream<User> get user => _authApi.user;

  /// A description for method loginWithEmailAndPassword
  Future<Either<LoginException, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authApi.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(user);
    } on LoginException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(LoginException(LoginFailure.unknown));
    }
  }

  /// A description for method createUserWithEmailAndPassword
  Future<Either<SignupException, User>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final user = await _authApi.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(user);
    } on SignupException catch (e) {
      return Left(e);
    }
  }

  /// A description for method loginWithGoogle
  Future<Either<LoginException, User>> loginWithGoogle() async {
    try {
      final user = await _authApi.loginWithGoogle();
      return right(user);
    } catch (e) {
      return left(LoginException(LoginFailure.unknown));
    }
  }

  /// A description for method logout
  Future<void> logout() => _authApi.logout();
}
