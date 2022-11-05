import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stickers_api/stickers_api.dart';

const _kAlumKey = 'Album';

/// {@template local_storage_stickers_api}
/// Implementation for stickers_api
/// {@endtemplate}
class LocalStorageStickersApi implements StickersApi {
  /// {@macro local_storage_stickers_api}
  LocalStorageStickersApi(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  final StreamController<Album?> _streamController =
      StreamController.broadcast();

  @override
  Stream<Album?> get album => _streamController.stream;

  @override
  Future<Album?> getAlbum([String? uid]) async {
    final item = _sharedPreferences.getString(_kAlumKey);
    if (item != null) {
      try {
        final json = jsonDecode(item);
        final album = Album.fromJson(json as Map<String, dynamic>);
        if (_streamController.hasListener && !_streamController.isPaused) {
          _streamController.add(album);
        }
        return album;
      } on FormatException {
        await _sharedPreferences.remove(_kAlumKey);
      }
    }
    return null;
  }

  @override
  Future<void> saveAlbum(Album album) async {
    if (_streamController.hasListener && !_streamController.isPaused) {
      _streamController.add(album);
    }
    final json = album.toJson();
    final raw = jsonEncode(json);
    await _sharedPreferences.setString(_kAlumKey, raw);
  }
}
