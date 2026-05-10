import 'package:equatable/equatable.dart';

import 'package:stickers_api/src/models/models.dart';
import 'package:uuid/uuid.dart';

part 'album.g.dart';

/// {@template album}
/// Album description
/// {@endtemplate}
class Album extends Equatable {
  /// {@macro album}
  const Album({
    required this.id,
    required this.name,
    required this.teams,
  });

  /// Creates a Album from Json map
  factory Album.fromJson(Map<String, dynamic> data) => _$AlbumFromJson(data);

  /// Album ID
  final String id;

  /// Album Name
  final String name;

  /// A description for teams
  final List<Team> teams;

  /// Creates a copy of the current Album with property changes
  Album copyWith({
    String? id,
    String? name,
    List<Team>? teams,
  }) {
    return Album(
      id: id ?? this.id,
      name: name ?? this.name,
      teams: teams ?? this.teams,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        teams,
      ];

  /// Creates a Json map from a Album
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
