import 'package:isar/isar.dart';
import 'package:isar_stickers_api/src/models/models.dart';
import 'package:stickers_api/stickers_api.dart' show Team, Sticker;

part 'isar_team.g.dart';

/// {@template isar_team}
/// IsarTeam description
/// {@endtemplate}
@embedded
class IsarTeam {
  /// {@macro isar_team}
  IsarTeam({
    this.code,
    this.name,
    this.stickers,
  });

  /// Build collection from domain model
  factory IsarTeam.fromDomain(Team team) => IsarTeam(
        code: team.code,
        name: team.name,
        stickers: team.stickers.map(IsarSticker.fromDomain).toList(),
      );

  /// The team code
  String? code;

  /// The name of the team
  String? name;

  /// A description for stickers
  List<IsarSticker>? stickers;

  /// Exports the instance to a domain class
  Team toDomain() => Team(
        code: code ?? '',
        name: name ?? '',
        stickers:
            stickers?.map((isarSticker) => isarSticker.toDomain()).toList() ??
                <Sticker>[],
      );
}
