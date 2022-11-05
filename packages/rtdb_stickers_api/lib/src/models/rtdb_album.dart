import 'package:stickers_api/stickers_api.dart';

/// {@template rtdb_album}
/// Helps build an Album instance from Realtime Database
/// {@endtemplate}
class RtdbAlbum extends Album {
  /// {@macro rtdb_album}
  const RtdbAlbum({required super.teams});

  /// Build an instance from Realtime Database
  factory RtdbAlbum.fromRtdb(dynamic data) {
    if (data is Map<dynamic, dynamic>) {
      final rawMap = Map<String, dynamic>.from(data);
      final rawTeams = rawMap['teams'] as List<dynamic>;
      final teams = rawTeams.map((e) {
        final rawTeam = Map<String, dynamic>.from(e as Map<dynamic, dynamic>);
        final code = rawTeam['code'] as String;
        final name = rawTeam['name'] as String;
        final stickers = (rawTeam['stickers'] as List<dynamic>).map((s) {
          final rawSticker =
              Map<String, dynamic>.from(s as Map<dynamic, dynamic>);
          return Sticker.fromJson(rawSticker, teamCode: code);
        }).toList();
        return Team(code: code, name: name, stickers: stickers);
      }).toList();
      return RtdbAlbum(teams: teams);
    }
    throw const FormatException();
  }
}
