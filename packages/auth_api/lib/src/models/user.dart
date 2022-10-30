import 'package:equatable/equatable.dart';

part 'user.g.dart';

/// {@template user}
/// User description
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.uid,
    this.email,
    this.name,
    this.photoUrl,
  });

  /// Creates a User from Json map
  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  /// A description for uid
  final String uid;

  /// A description for email
  final String? email;

  /// A description for name
  final String? name;

  /// A description for photoUrl
  final String? photoUrl;

  /// Empty user represents unauthenticated state
  static const empty = User(uid: '');

  /// Creates a copy of the current User with property changes
  User copyWith({
    String? uid,
    String? email,
    String? name,
    String? photoUrl,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  List<Object?> get props => [
        uid,
        email,
        name,
        photoUrl,
      ];

  /// Creates a Json map from a User
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
