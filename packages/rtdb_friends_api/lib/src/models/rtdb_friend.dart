import 'package:friends_api/friends_api.dart';

/// {@template rtdb_album}
/// Helps build an Album instance from Realtime Database
/// {@endtemplate}
class RtdbFriend extends Friend {
  /// {@macro rtdb_album}
  const RtdbFriend({
    required super.uid,
    required super.email,
    required super.name,
  });

  /// Build an instance from Realtime Database
  factory RtdbFriend.fromRtdb(String key, dynamic data) {
    if (data is Map<dynamic, dynamic>) {
      final rawMap = Map<String, dynamic>.from(data);
      final email = rawMap['email'] as String;
      final name = rawMap['name'] as String;
      return RtdbFriend(
        uid: key,
        email: email,
        name: name,
      );
    }
    throw const FormatException();
  }
}
