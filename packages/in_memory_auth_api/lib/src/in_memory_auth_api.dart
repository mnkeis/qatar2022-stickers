import 'dart:async';
import 'dart:convert';

import 'package:auth_api/auth_api.dart';
import 'package:crypto/crypto.dart';

/// {@template fake_auth_repository_api}
/// Implementation for auth_repository_api
/// {@endtemplate}
class InMemoryAuthApi implements AuthApi {
  /// {@macro fake_auth_repository_api}
  InMemoryAuthApi();

  final StreamController<User> _controller = StreamController();

  @override
  Stream<User> get user => _controller.stream;

  final Map<String, dynamic> _usersCache = {};

  @override
  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final user = await Future<User>.delayed(
      const Duration(milliseconds: 300),
      () {
        final json = _usersCache[email] as Map<String, dynamic>?;
        if (json == null) {
          throw LoginException(LoginFailure.userNotFound);
        }
        if (json['password'] != password) {
          throw LoginException(LoginFailure.invalidPassword);
        }
        return User.fromJson(json);
      },
    );
    _controller.add(user);
    return user;
  }

  @override
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final existent = _usersCache.containsKey(email);
    if (existent) {
      throw SignupException(SignupFailure.userAlreadyExists);
    }
    final user = User(
      uid: base64.encode(sha256.convert(utf8.encode(email)).bytes),
      email: email,
    );
    _usersCache.putIfAbsent(
      email,
      () => user.toJson().putIfAbsent(
            'password',
            () => base64.encode(sha256.convert(utf8.encode(password)).bytes),
          ),
    );
    _controller.add(user);
    return user;
  }

  @override
  Future<User> loginWithGoogle() async {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    await Future.delayed(
      const Duration(milliseconds: 200),
      () => _controller.add(User.empty),
    );
  }
}
