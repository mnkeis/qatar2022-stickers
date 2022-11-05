part of 'friends_cubit.dart';

abstract class FriendsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FriendsInitial extends FriendsState {}

class FriendsLoading extends FriendsState {}

class FriendsLoaded extends FriendsState {
  FriendsLoaded(this.friends);

  final List<Friend> friends;

  @override
  List<Object?> get props => [friends];
}

class FriendsError extends FriendsState {
  FriendsError(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
