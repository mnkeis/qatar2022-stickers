import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friends_repository/friends_repository.dart';

part 'friends_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit(this._friendsRepository) : super(FriendsInitial());

  final FriendsRepository _friendsRepository;

  Future<void> load() async {
    emit(FriendsLoading());
    try {
      final friends = await _friendsRepository.get();
      emit(FriendsLoaded(friends));
    } catch (e) {
      print(e);
      emit(FriendsError(e.toString()));
    }
  }

  Future<void> addFriend(String email) async {
    try {
      await _friendsRepository.add(email: email);
      await load();
    } catch (e) {
      print(e);
    }
  }
}
