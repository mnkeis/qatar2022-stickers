import 'package:friends_api/friends_api.dart';

/// {@template friends_repository}
/// Description for this repository
/// {@endtemplate}
class FriendsRepository {
  /// {@macro friends_repository}
  const FriendsRepository(this.friendsApi);

  /// API interface for this repository
  final FriendsApi friendsApi;

  /// A description for method get
  Future<List<Friend>> get() => friendsApi.get();

  /// A description for method add
  Future<void> add({
    required String email,
  }) =>
      friendsApi.add(
        email: email,
      );
}
