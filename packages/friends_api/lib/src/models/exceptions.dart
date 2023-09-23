/// {@template friends_failure}
/// Possible failures when dealing with friends
/// {@endtemplate}
enum FriendsFailure {
  /// Unknown failure
  unknown,

  /// User not logged in
  notLoggedIn,

  /// Trying to add himself as friend
  canNotAddYourself,

  /// Searched friend was not found
  userNotFound,
}

/// {@template friends_exception}
class FriendsException implements Exception {
  /// {@macro friends_exception}
  FriendsException(this.failure);

  /// Failure thrown
  final FriendsFailure failure;
}
