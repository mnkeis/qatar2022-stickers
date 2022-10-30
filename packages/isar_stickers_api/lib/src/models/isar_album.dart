import 'package:isar/isar.dart';
import 'package:isar_stickers_api/src/models/models.dart';
import 'package:stickers_api/stickers_api.dart' show Album, Team;

part 'isar_album.g.dart';

/// {@template isar_album}
/// IsarAlbum description
/// {@endtemplate}
@Collection()
class IsarAlbum {
  /// {@macro isar_album}
  IsarAlbum({
    this.id,
    this.teams,
  });

  /// Builds collection from
  factory IsarAlbum.fromDomain({required Album album, Id id = 1}) {
    return IsarAlbum(
      id: id,
      teams: album.teams.map(IsarTeam.fromDomain).toList(),
    );
  }

  /// Isar id
  Id? id;

  /// A description for teams
  List<IsarTeam>? teams;

  /// Exports the instance to a domain class
  Album toDomain() => Album(
        teams:
            teams?.map((isarTeam) => isarTeam.toDomain()).toList() ?? <Team>[],
      );
}
