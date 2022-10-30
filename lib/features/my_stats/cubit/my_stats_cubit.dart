// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc/bloc.dart';
import 'package:stickers_repository/stickers_repository.dart';

part 'my_stats_state.dart';

class MyStatsCubit extends Cubit<MyStatsState> {
  MyStatsCubit(this.stickersRepository) : super(const MyStatsState());

  final StickersRepository stickersRepository;

  Future<void> load() async {
    final album = await stickersRepository.getAlbum();
    final totalStickers = album.teams.fold(
      0,
      (previousQuantity, team) =>
          previousQuantity +
          team.stickers.fold(0, (previousValue, _) => previousValue + 1),
    );
    final collectedStickers = album.teams.fold(
      0,
      (previousQuantity, team) =>
          previousQuantity +
          team.stickers.fold(
            0,
            (previousValue, sticker) =>
                sticker.qty > 0 ? previousValue + 1 : previousValue,
          ),
    );
    final swapStickers = album.teams.fold(
      0,
      (previousQuantity, team) =>
          previousQuantity +
          team.stickers.fold(
            0,
            (previousValue, sticker) => sticker.qty > 1
                ? previousValue + (sticker.qty - 1)
                : previousValue,
          ),
    );
    emit(
      MyStatsState(
        totalStickers: totalStickers,
        collectedStickers: collectedStickers,
        swapStickers: swapStickers,
        missingStickers: totalStickers - collectedStickers,
        completedPercent:
            (collectedStickers / totalStickers * 100).toStringAsPrecision(3),
      ),
    );
  }
}
