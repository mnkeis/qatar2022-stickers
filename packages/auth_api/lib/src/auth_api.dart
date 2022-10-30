import 'package:auth_api/src/models/models.dart';

/// {@template auth_repository_api}
/// API interface for auth_repository
/// {@endtemplate}
abstract class AuthApi {
  /// {@macro auth_repository_api}
  const AuthApi();

  /// Stream user states changes
  Stream<User> get user;

  /// A description for method loginWithEmailAndPassword
  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// A description for method createUserWithEmailAndPassword
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// A description for method loginWithGoogle
  Future<User> loginWithGoogle();

  /// A description for method logout
  Future<void> logout();
}
