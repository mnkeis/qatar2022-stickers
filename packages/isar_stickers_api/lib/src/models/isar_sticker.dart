import 'package:isar/isar.dart';
import 'package:stickers_api/stickers_api.dart' show Sticker;

part 'isar_sticker.g.dart';

/// {@template isar_sticker}
/// IsarSticker description
/// {@endtemplate}
@embedded
class IsarSticker {
  /// {@macro isar_sticker}
  IsarSticker({
    this.qty,
    this.index,
    this.name,
  });

  /// Build collection from domain model
  factory IsarSticker.fromDomain(Sticker sticker) => IsarSticker(
        qty: sticker.qty,
        index: sticker.index,
        name: sticker.name,
      );

  /// A description for qty
  int? qty;

  /// Index into the set
  int? index;

  /// The name of the player
  String? name;

  /// Exports instance to domain class
  Sticker toDomain() => Sticker(
        qty: qty ?? 0,
        index: index ?? 0,
        name: name,
      );
}
