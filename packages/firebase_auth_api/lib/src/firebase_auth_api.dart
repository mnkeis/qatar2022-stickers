import 'dart:async';
import 'dart:convert';

import 'package:auth_api/auth_api.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'auth_failure.dart';

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class FirebaseAuthApi implements AuthApi {
  /// {@macro authentication_repository}
  FirebaseAuthApi({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  /// Whether or not the current environment is web
  /// Should only be overriden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  @override
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      return user;
    });
  }

  /// Sends the verification email to the current user.
  ///
  /// Returns
  ///
  Future<void>? verifyEmail() {
    return _firebaseAuth.currentUser?.sendEmailVerification();
  }

  /// Sends a password recovery email
  Future<void> passwordRecovery(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (_) {
      throw AuthException();
    } on Exception catch (_) {
      rethrow;
    }
  }

  /// Update user name
  Future<void>? updateUserName({
    String? name,
  }) {
    return _firebaseAuth.currentUser?.updateDisplayName(name);
  }

  /// Update user name
  Future<void>? updatePhotoUrl({
    String? photoUrl,
  }) {
    return _firebaseAuth.currentUser?.updatePhotoURL(photoUrl);
  }

  /// Signs in with Apple account
  Future<User> logInWithApple() async {
    try {
      final rawNonce = generateNonce();
      final nonce = sha256OfString(rawNonce);

      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential =
          firebase_auth.OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      // Sign in the user with Firebase.
      final userCredential =
          await _firebaseAuth.signInWithCredential(oauthCredential);

      final user = userCredential.user;

      if (user != null) {
        return user.toUser;
      }
    } on firebase_auth.FirebaseAuthException catch (_) {
      throw LoginException(LoginFailure.unknown);
    }
    throw LoginException(LoginFailure.unknown);
  }

  /// Creates a new user with the provided [email] and [password].
  @override
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firebaseAuth.currentUser?.sendEmailVerification();
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        return user.toUser;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      throw FirebaseAuthSignupException.fromFirebaseAuthException(e);
    }
    throw SignupException(SignupFailure.unknown);
  }

  /// Signs in with the provided [email] and [password].
  @override
  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        return user.toUser;
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthLoginException.fromFirebaseAuthException(e);
    }
    throw LoginException(LoginFailure.unknown);
  }

  /// Starts the Sign In with Google Flow.
  @override
  Future<User> loginWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
        );
        final user = userCredential.user;
        if (user != null) {
          return user.toUser;
        }
      } else {
        final googleUser = await _googleSignIn.signIn();
        if (googleUser != null) {
          final googleAuth = await googleUser.authentication;
          credential = firebase_auth.GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          final userCredential =
              await _firebaseAuth.signInWithCredential(credential);
          final user = userCredential.user;
          if (user != null) {
            return user.toUser;
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthLoginException.fromFirebaseAuthException(e);
    }
    throw LoginException(LoginFailure.unknown);
  }

  @override
  Future<void> logout() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } on Exception catch (_) {
      throw LogoutException();
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(
      uid: uid,
      email: email,
      name: displayName,
      photoUrl: photoURL,
    );
  }
}

/// Generates a cryptographically secure random nonce, to be included in a
/// credential request.
// String generateNonce([int length = 32]) {
//   const charset =
//       '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//   final random = Random.secure();
//   return List.generate(length, (_) =>
// charset[random.nextInt(charset.length)])
//       .join();
// }

/// Returns the sha256 hash of [input] in hex notation.
String sha256OfString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}
