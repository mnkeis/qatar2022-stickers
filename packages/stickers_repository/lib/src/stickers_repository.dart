import 'package:stickers_api/stickers_api.dart';
import 'package:stickers_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';

/// {@template stickers_repository}
/// Repository to manage your stickers
/// {@endtemplate}
class StickersRepository {
  /// {@macro stickers_repository}
  const StickersRepository(this.stickersApi);

  /// API interface for this repository
  final StickersApi stickersApi;

  /// A description for method getAlbum
  Future<List<Album>> getUserAlbums() => stickersApi.getUserAlbums();

  /// Stream of album updates
  Stream<Album> album(String id) => stickersApi.album(id);

  /// A description for method getAlbum
  Future<Album> getAlbum(String id) => stickersApi.getAlbum(id);

  /// Returns available albums
  List<Album> availableAlbums() => [
    FifaWorldCupEEUUMexicoCanada2026EmptyAlbum(),
    ConmebolCopaAmericaUsa2024EmptyAlbum(),
    FifaWorldCupQatar2022EmptyAlbum(),
  ];

  /// Save album
  Future<void> saveAlbum(Album album) {
    if (album.id == '') {
      return stickersApi.saveAlbum(album.copyWith(id: const Uuid().v4()));
    }
    return stickersApi.saveAlbum(album);
  }
}
