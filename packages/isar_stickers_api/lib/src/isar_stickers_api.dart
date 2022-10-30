import 'package:isar/isar.dart';
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

  /// Listen to Album changes
  @override
  Stream<Album?> get album {
    return _isarInstance.isarAlbums
        .watchObject(_kAlbumId)
        .map((isarAlbum) => isarAlbum?.toDomain());
  }

  /// Gets the album
  @override
  Future<Album?> getAlbum() async {
    final isarAlbum = await _isarInstance.isarAlbums.get(_kAlbumId);
    return isarAlbum?.toDomain();
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
