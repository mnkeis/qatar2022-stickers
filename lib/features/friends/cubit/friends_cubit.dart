import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friends_repository/friends_repository.dart';

part 'friends_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit(this._friendsRepository) : super(FriendsInitial());

  final FriendsRepository _friendsRepository;

  Future<void> load() async {
    emit(FriendsLoading());
    final result = await _friendsRepository.get();
    result.fold(
      (e) => emit(FriendsError(e.failure)),
      (friends) => emit(FriendsLoaded(friends)),
    );
  }

  Future<void> addFriend(String email) async {
    final result = await _friendsRepository.add(email: email);
    result.fold((e) => emit(FriendsError(e.failure)), (r) => unawaited(load()));
  }
}
