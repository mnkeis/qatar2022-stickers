import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stickers_api/stickers_api.dart';

const _kAlbumsKey = 'StickerAlbums';

/// {@template local_storage_stickers_api}
/// Implementation for stickers_api
/// {@endtemplate}
class LocalStorageStickersApi implements StickersApi {
  /// {@macro local_storage_stickers_api}
  LocalStorageStickersApi(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  final StreamController<Album> _streamController =
      StreamController.broadcast();

  @override
  Future<List<Album>> getUserAlbums() async {
    final item = _sharedPreferences.getString(_kAlbumsKey);
    if (item != null) {
      try {
        final json = jsonDecode(item);
        if (json is Map<String, dynamic>) {
          final albums = json.values
              .map((value) => Album.fromJson(value as Map<String, dynamic>))
              .toList();
          return albums;
        }
      } on FormatException {
        await _sharedPreferences.remove(_kAlbumsKey);
      }
    }
    return [];
  }

  @override
  Stream<Album> album(String id) => _streamController.stream;

  @override
  Future<Album> getAlbum(String id) async {
    final item = _sharedPreferences.getString(_kAlbumsKey);
    if (item != null) {
      try {
        final json = jsonDecode(item);
        if (json is Map<String, dynamic> && json[id] != null) {
          final album = Album.fromJson(json[id] as Map<String, dynamic>);
          if (_streamController.hasListener && !_streamController.isPaused) {
            _streamController.add(album);
          }
          return album;
        }
      } on FormatException {
        await _sharedPreferences.remove(_kAlbumsKey);
      }
    }
    throw Exception('invalid-id');
  }

  @override
  Future<void> saveAlbum(Album album) async {
    if (_streamController.hasListener && !_streamController.isPaused) {
      _streamController.add(album);
    }
    final item = _sharedPreferences.getString(_kAlbumsKey);
    Map<String, dynamic>? json;
    if (item != null) {
      try {
        final rawJson = jsonDecode(item);
        if (rawJson is Map<String, dynamic>) {
          json = rawJson;
        }
      } on FormatException {
        await _sharedPreferences.remove(_kAlbumsKey);
      }
    }
    final albums = json ?? <String, dynamic>{};
    albums[album.id] = album.toJson();
    final raw = jsonEncode(albums);
    await _sharedPreferences.setString(_kAlbumsKey, raw);
  }
}
