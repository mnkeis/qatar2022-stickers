part of 'album.dart';

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      id: json['id'] as String? ?? const Uuid().v4(),
      name: json['name'] as String? ?? '',
      teams: (json['teams'] as List<dynamic>)
          .map((dynamic e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'teams': instance.teams.map((e) => e.toJson()).toList(),
    };
