part of 'album.dart';

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      teams: (json['teams'] as List<dynamic>)
          .map((dynamic e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'teams': instance.teams.map((e) => e.toJson()).toList(),
    };
