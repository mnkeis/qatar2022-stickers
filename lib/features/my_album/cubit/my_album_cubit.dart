// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:stickers_repository/stickers_repository.dart';

class MyAlbumCubit extends Cubit<Album> {
  MyAlbumCubit(this.stickersRepository) : super(const Album(teams: []));

  final StickersRepository stickersRepository;
  late final StreamSubscription<Album> _streamSubscription;

  Future<void> load() async {
    final album = await stickersRepository.getAlbum();
    emit(album);
    _streamSubscription = stickersRepository.album.listen(emit);
  }

  void increment({
    required int value,
    required int stickerIndex,
    required int teamIndex,
  }) {
    final updated = state.copyWith(
      teams: state.teams.mapIndexed((index, team) {
        if (index == teamIndex) {
          return team.copyWith(
            stickers: team.stickers.mapIndexed((i, sticker) {
              if (i == stickerIndex) {
                return sticker.copyWith(qty: ++value);
              }
              return sticker;
            }).toList(),
          );
        }
        return team;
      }).toList(),
    );
    stickersRepository.saveAlbum(updated);
    // emit(updated);
  }

  void decrement({
    required int value,
    required int stickerIndex,
    required int teamIndex,
  }) {
    if (value == 0) return;
    final updated = state.copyWith(
      teams: state.teams.mapIndexed((index, team) {
        if (index == teamIndex) {
          return team.copyWith(
            stickers: team.stickers.mapIndexed((index, sticker) {
              if (index == stickerIndex) {
                return sticker.copyWith(qty: --value);
              }
              return sticker;
            }).toList(),
          );
        }
        return team;
      }).toList(),
    );
    stickersRepository.saveAlbum(updated);
    // emit(updated);
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
