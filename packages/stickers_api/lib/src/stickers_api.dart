import 'package:stickers_api/src/models/models.dart';

/// {@template stickers_api}
/// API interface for stickers
/// {@endtemplate}
abstract class StickersApi {
  /// {@macro stickers_api}
  const StickersApi();

  /// Listen to Album changes
  Stream<Album?> get album;

  /// Gets the album
  Future<Album?> getAlbum();

  /// Save the album
  Future<void> saveAlbum(Album album);
}
