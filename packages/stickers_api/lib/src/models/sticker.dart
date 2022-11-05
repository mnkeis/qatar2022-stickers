import 'package:equatable/equatable.dart';

part 'sticker.g.dart';

/// {@template sticker}
/// Sticker description
/// {@endtemplate}
class Sticker extends Equatable {
  /// {@macro sticker}
  const Sticker({
    required this.qty,
    required this.index,
    this.teamCode,
    this.name,
  });

  /// Creates a Sticker from Json map
  factory Sticker.fromJson(
    Map<String, dynamic> data, {
    String? teamCode,
  }) =>
      _$StickerFromJson(data, teamCode: teamCode);

  /// A description for qty
  final int qty;

  /// Index into the set
  final int index;

  /// Team code for the sticker
  final String? teamCode;

  /// The name of the player
  final String? name;

  /// Creates a copy of the current Sticker with property changes
  Sticker copyWith({
    int? qty,
    int? index,
    String? teamCode,
    String? name,
  }) {
    return Sticker(
      qty: qty ?? this.qty,
      index: index ?? this.index,
      teamCode: teamCode ?? this.teamCode,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [qty, index];

  @override
  String toString() => '$teamCode $index';

  /// Creates a Json map from a Sticker
  Map<String, dynamic> toJson() => _$StickerToJson(this);
}
