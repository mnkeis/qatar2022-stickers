part of 'sticker.dart';

Sticker _$StickerFromJson(Map<String, dynamic> json) => Sticker(
      qty: json['qty'] as int,
      index: json['index'] as int,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$StickerToJson(Sticker instance) => <String, dynamic>{
      'qty': instance.qty,
      'index': instance.index,
      'name': instance.name,
    };
