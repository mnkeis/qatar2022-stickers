import 'package:equatable/equatable.dart';

part 'friend.g.dart';

/// {@template friend}
/// Friend description
/// {@endtemplate}
class Friend extends Equatable {
  /// {@macro friend}
  const Friend({ 
    required this.uid,
    required this.email,
    required this.name,
  });

  /// Creates a Friend from Json map
  factory Friend.fromJson(Map<String, dynamic> data) => _$FriendFromJson(data);

  /// A description for uid
  final String uid;
  /// A description for email
  final String email;
  /// A description for name
  final String name;

  /// Creates a copy of the current Friend with property changes
  Friend copyWith({ 
    String? uid,
    String? email,
    String? name,
  }) {
    return Friend(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }
  
  @override
  List<Object?> get props => [
        uid,
        email,
        name,
      ];

  /// Creates a Json map from a Friend
  Map<String, dynamic> toJson() => _$FriendToJson(this);
}
