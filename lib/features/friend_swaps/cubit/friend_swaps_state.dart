part of 'friend_swaps_cubit.dart';

abstract class FriendSwapsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FriendSwapsInitial extends FriendSwapsState {}

class FriendSwapsLoading extends FriendSwapsState {}

class FriendSwapsLoaded extends FriendSwapsState {
  FriendSwapsLoaded({
    required this.stickersToGet,
    required this.stickersToGive,
  });

  final List<Sticker> stickersToGive;
  final List<Sticker> stickersToGet;

  @override
  List<Object?> get props => [stickersToGet, stickersToGive];
}

class FriendSwapsError extends FriendSwapsState {
  FriendSwapsError(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
