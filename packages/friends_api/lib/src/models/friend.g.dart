part of 'friend.dart';

Friend _$FriendFromJson(Map<String, dynamic> json) => Friend(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$FriendToJson(Friend instance) => <String, dynamic>{ 
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
    };