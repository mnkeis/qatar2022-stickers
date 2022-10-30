part of 'team.dart';

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      code: json['code'] as String,
      name: json['name'] as String,
      stickers: (json['stickers'] as List<dynamic>)
          .map((dynamic e) => Sticker.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'stickers': instance.stickers.map((e) => e.toJson()).toList(),
    };
