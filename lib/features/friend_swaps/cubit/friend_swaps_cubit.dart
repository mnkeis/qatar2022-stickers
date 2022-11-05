import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:friends_repository/friends_repository.dart';
import 'package:stickers_repository/stickers_repository.dart';

part 'friend_swaps_state.dart';

class FriendSwapsCubit extends Cubit<FriendSwapsState> {
  FriendSwapsCubit({
    required StickersRepository stickersRepository,
    required Friend friend,
  })  : _stickersRepository = stickersRepository,
        _friend = friend,
        super(FriendSwapsInitial());

  final StickersRepository _stickersRepository;
  final Friend _friend;

  Future<void> load() async {
    emit(FriendSwapsLoading());
    try {
      final myAlbum = await _stickersRepository.getAlbum();
      final friendAlbum = await _stickersRepository.getAlbum(_friend.uid);

      final mySwaps = myAlbum.teams
          .map((team) => team.stickers.where((sticker) => sticker.qty > 1))
          .expand((element) => element)
          .toList();
      final myMissings = myAlbum.teams
          .map((team) => team.stickers.where((sticker) => sticker.qty == 0))
          .expand((element) => element)
          .toList();
      final friendSwaps = friendAlbum.teams
          .map((team) => team.stickers.where((sticker) => sticker.qty > 1))
          .expand((element) => element)
          .toList();
      final friendMissings = friendAlbum.teams
          .map((team) => team.stickers.where((sticker) => sticker.qty == 0))
          .expand((element) => element)
          .toList();

      final stickersToGive = mySwaps
          .where(
            (mySticker) => friendMissings
                .where(
                  (friendSticker) =>
                      mySticker.teamCode == friendSticker.teamCode &&
                      mySticker.index == friendSticker.index,
                )
                .isNotEmpty,
          )
          .toList();

      final stickersToGet = friendSwaps
          .where(
            (friendSticker) => myMissings
                .where(
                  (mySticker) =>
                      mySticker.teamCode == friendSticker.teamCode &&
                      mySticker.index == friendSticker.index,
                )
                .isNotEmpty,
          )
          .toList();

      emit(
        FriendSwapsLoaded(
          stickersToGet: stickersToGet,
          stickersToGive: stickersToGive,
        ),
      );
    } catch (e) {
      emit(FriendSwapsError(e.toString()));
    }
  }
}
