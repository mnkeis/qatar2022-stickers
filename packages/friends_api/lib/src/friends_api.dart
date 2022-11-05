import 'package:friends_api/src/models/models.dart';

/// {@template friends_api}
/// API interface for friends
/// {@endtemplate}
abstract class FriendsApi {
  /// {@macro friends_api}
  const FriendsApi();

  /// A description for method get
  Future<List<Friend>> get();

  /// A description for method add
  Future<void> add({
    required String email,
  });
}
