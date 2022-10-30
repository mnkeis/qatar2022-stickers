import 'package:equatable/equatable.dart';

import 'package:stickers_api/src/models/models.dart';

part 'team.g.dart';

/// {@template team}
/// Team description
/// {@endtemplate}
class Team extends Equatable {
  /// {@macro team}
  const Team({
    required this.code,
    required this.name,
    required this.stickers,
  });

  /// Creates an empty team set
  factory Team.empty({
    required String code,
    required String name,
    int length = 19,
    int startIndex = 1,
  }) =>
      Team(
        code: code,
        name: name,
        stickers: List.generate(
          length,
          (index) => Sticker(index: index + startIndex, qty: 0),
        ),
      );

  /// Creates an empty team set
  factory Team.full({
    required String code,
    required String name,
    int length = 19,
    int startIndex = 0,
  }) =>
      Team(
        code: code,
        name: name,
        stickers: List.generate(
          length,
          (index) => Sticker(index: index + startIndex, qty: 1),
        ),
      );

  /// Creates a Team from Json map
  factory Team.fromJson(Map<String, dynamic> data) => _$TeamFromJson(data);

  /// The team code
  final String code;

  /// The name of the team
  final String name;

  /// A description for stickers
  final List<Sticker> stickers;

  /// Creates a copy of the current Team with property changes
  Team copyWith({
    String? code,
    String? name,
    List<Sticker>? stickers,
  }) {
    return Team(
      code: code ?? this.code,
      name: name ?? this.name,
      stickers: stickers ?? this.stickers,
    );
  }

  @override
  List<Object?> get props => [
        code,
        name,
        stickers,
      ];

  /// Creates a Json map from a Team
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
