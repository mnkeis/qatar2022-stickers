import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rtdb_stickers_api/src/models/rtdb_album.dart';
import 'package:stickers_api/stickers_api.dart';
import 'package:uuid/uuid.dart';

/// {@template rtdb_stickers_api}
/// Implementation for stickers_api with firebase realtime database
/// {@endtemplate}
class RtdbStickersApi implements StickersApi {
  /// {@macro local_storage_stickers_api}
  RtdbStickersApi({
    FirebaseDatabase? database,
    FirebaseAuth? auth,
  })  : _database = database ?? FirebaseDatabase.instance,
        _auth = auth ?? FirebaseAuth.instance;

  final FirebaseDatabase _database;
  final FirebaseAuth _auth;

  @override
  Future<List<Album>> getUserAlbums() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception();
    }
    final dbRef = _database.ref('albums/${user.uid}');
    final snapshot = await dbRef.get();
    final data = snapshot.value;
    if (data is Map<dynamic, dynamic>) {
      final rawList = Map<String, dynamic>.from(data);
      if (data['teams'] != null) {
        final album = RtdbAlbum.fromRtdb(data)
            .copyWith(name: 'FIFA World Cup Qatar 2022', id: const Uuid().v4());
        final dbRef = _database.ref('albums/${user.uid}');
        final json = album.toJson();
        await dbRef.set({album.id: json});
        return [album];
      }
      return rawList.values.map(RtdbAlbum.fromRtdb).toList();
    }
    return [];
  }

  @override
  Stream<Album> album(String id) {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception();
    }
    final dbRef = _database.ref('albums/${user.uid}/$id');
    return dbRef.onValue.map((event) {
      final data = event.snapshot.value;
      return RtdbAlbum.fromRtdb(data);
    });
  }

  @override
  Future<Album> getAlbum(String id) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception();
    }
    if (user.email != null) {
      final userRef = _database.ref(
        'users/${user.email!.replaceAll('@', '_at_').replaceAll('.', '_')}',
      );
      await userRef.set({
        'uid': user.uid,
        'name': user.displayName,
      });
    }
    final dbRef = _database.ref('albums/${user.uid}/$id');
    final snapshot = await dbRef.get();
    final data = snapshot.value;
    if (data == null) {
      throw Exception();
    }
    return RtdbAlbum.fromRtdb(data);
  }

  @override
  Future<void> saveAlbum(Album album) async {
    final user = _auth.currentUser;
    if (user != null) {
      final dbRef = _database.ref('albums/${user.uid}/${album.id}');
      final json = album.toJson();
      await dbRef.set(json);
    }
  }
}
