import 'package:isar_community/isar.dart';
import 'package:isar_stickers_api/src/models/models.dart';
import 'package:stickers_api/stickers_api.dart';

const _kAlbumId = 1;

/// {@template stickers_api}
/// API interface for stickers
/// {@endtemplate}
class IsarStickersApi implements StickersApi {
  /// {@macro stickers_api}
  const IsarStickersApi(this._isarInstance);

  final Isar _isarInstance;

  @override
  Future<List<Album>> getUserAlbums() async {
    return [];
  }

  /// Listen to Album changes
  @override
  Stream<Album> album(String id) {
    return _isarInstance.isarAlbums
        .watchObject(int.parse(id))
        .map(
          (isarAlbum) =>
              isarAlbum?.toDomain() ??
              Album(
                id: id,
                name: '',
                teams: const [],
              ),
        );
  }

  /// Gets the album
  @override
  Future<Album> getAlbum(String id) async {
    final isarAlbum = await _isarInstance.isarAlbums.get(_kAlbumId);
    return isarAlbum?.toDomain() ??
        Album(
          id: id,
          name: '',
          teams: const [],
        );
  }

  /// Save the album
  @override
  Future<void> saveAlbum(Album album) async {
    await _isarInstance.writeTxn(() async {
      await _isarInstance.isarAlbums.put(
        IsarAlbum.fromDomain(
          album: album,
          // id: _kAlbumId,
        ),
      );
    });
  }
}
