part of 'sticker.dart';

Sticker _$StickerFromJson(
  Map<String, dynamic> json, {
  String? teamCode,
}) =>
    Sticker(
      qty: json['qty'] as int,
      index: json['index'] as int,
      name: json['name'] as String?,
      teamCode: teamCode,
    );

Map<String, dynamic> _$StickerToJson(Sticker instance) => <String, dynamic>{
      'qty': instance.qty,
      'index': instance.index,
      'name': instance.name,
    };
