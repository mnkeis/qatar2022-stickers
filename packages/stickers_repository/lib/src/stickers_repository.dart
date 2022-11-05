import 'package:stickers_api/stickers_api.dart';
import 'package:stickers_repository/src/models/models.dart';

/// {@template stickers_repository}
/// Repository to manage your stickers
/// {@endtemplate}
class StickersRepository {
  /// {@macro stickers_repository}
  const StickersRepository(this.stickersApi);

  /// API interface for this repository
  final StickersApi stickersApi;

  /// Stream of album updates
  Stream<Album> get album =>
      stickersApi.album.map((album) => album ?? Qatar2022EmptyAlbum());

  /// A description for method getAlbum
  Future<Album> getAlbum([String? uid]) async {
    final album = await stickersApi.getAlbum(uid);
    if (album != null) {
      return album;
    }
    return Qatar2022EmptyAlbum();
  }

  /// Save album
  Future<void> saveAlbum(Album album) => stickersApi.saveAlbum(album);
}
