import 'package:dartz/dartz.dart';
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
  Future<Either<FriendsException, List<Friend>>> get() async {
    try {
      final friends = await friendsApi.get();
      return right(friends);
    } on FriendsException catch (e) {
      return left(e);
    }
  }

  /// A description for method add
  Future<Either<FriendsException, Unit>> add({
    required String email,
  }) async {
    try {
      await friendsApi.add(
        email: email,
      );
      return right(unit);
    } on FriendsException catch (e) {
      return left(e);
    }
  }
}
