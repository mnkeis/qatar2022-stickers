import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:friends_api/friends_api.dart';
import 'package:rtdb_friends_api/src/models/rtdb_friend.dart';

/// {@template rtdb_friends_api}
/// Implementation for friends_api
/// {@endtemplate}
class RtdbFriendsApi implements FriendsApi {
  /// {@macro rtdb_friends_api}
  RtdbFriendsApi({
    FirebaseDatabase? database,
    FirebaseAuth? auth,
  })  : _database = database ?? FirebaseDatabase.instance,
        _auth = auth ?? FirebaseAuth.instance;

  final FirebaseDatabase _database;
  final FirebaseAuth _auth;

  @override
  Future<List<Friend>> get() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw FriendsException(FriendsFailure.notLoggedIn);
    }
    try {
      final dbRef = _database.ref('friends/${user.uid}');
      final snapshot = await dbRef.get();
      final value = snapshot.value;
      if (value != null && value is Map<dynamic, dynamic>) {
        final valueMap = Map<String, dynamic>.from(value);
        return valueMap.entries
            .map((e) => RtdbFriend.fromRtdb(e.key, e.value))
            .toList();
      }
      return [];
    } catch (_) {
      throw FriendsException(FriendsFailure.unknown);
    }
  }

  @override
  Future<void> add({
    required String email,
  }) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw FriendsException(FriendsFailure.notLoggedIn);
    }
    if (user.email == email) {
      throw FriendsException(FriendsFailure.canNotAddYourself);
    }

    try {
      final userRef = _database
          .ref('users/${email.replaceAll('@', '_at_').replaceAll('.', '_')}');
      final userSnapshot = await userRef.get();
      final userValue = userSnapshot.value;
      if (userValue != null && userValue is Map<dynamic, dynamic>) {
        final userMap = Map<String, dynamic>.from(userValue);
        final uid = userMap['uid'] as String;
        final name = userMap['name'] as String;
        final dbRef = _database.ref('friends/${user.uid}/$uid');
        await dbRef.set({
          'email': email,
          'name': name,
        });
        return;
      }
    } catch (e) {
      throw FriendsException(FriendsFailure.unknown);
    }
    throw FriendsException(FriendsFailure.userNotFound);
  }
}
