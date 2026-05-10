import 'package:stickers_api/src/models/models.dart';

/// {@template stickers_api}
/// API interface for stickers
/// {@endtemplate}
abstract class StickersApi {
  /// {@macro stickers_api}
  const StickersApi();

  /// Gets user albums
  Future<List<Album>> getUserAlbums();

  /// Listen to Album changes
  Stream<Album> album(String id);

  /// Gets the album
  Future<Album> getAlbum(String id);

  /// Save the album
  Future<void> saveAlbum(Album album);
}
