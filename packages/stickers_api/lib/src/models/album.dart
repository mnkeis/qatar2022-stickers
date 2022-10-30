import 'package:equatable/equatable.dart';

import 'package:stickers_api/src/models/models.dart';

part 'album.g.dart';

/// {@template album}
/// Album description
/// {@endtemplate}
class Album extends Equatable {
  /// {@macro album}
  const Album({
    required this.teams,
  });

  /// Creates a Album from Json map
  factory Album.fromJson(Map<String, dynamic> data) => _$AlbumFromJson(data);

  /// A description for teams
  final List<Team> teams;

  /// Creates a copy of the current Album with property changes
  Album copyWith({
    List<Team>? teams,
  }) {
    return Album(
      teams: teams ?? this.teams,
    );
  }

  @override
  List<Object?> get props => [
        teams,
      ];

  /// Creates a Json map from a Album
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
