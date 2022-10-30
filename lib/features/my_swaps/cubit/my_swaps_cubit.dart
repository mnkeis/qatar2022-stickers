// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc/bloc.dart';
import 'package:stickers_repository/stickers_repository.dart';

class MySwapsCubit extends Cubit<Album> {
  MySwapsCubit(this.stickersRepository) : super(const Album(teams: []));

  final StickersRepository stickersRepository;

  Future<void> load() async {
    final album = await stickersRepository.getAlbum();
    final swaps = album.copyWith(
      teams: album.teams
          .map(
            (e) => e.copyWith(
              stickers: e.stickers
                  .map((e) => e.copyWith(qty: e.qty > 1 ? e.qty - 1 : 0))
                  .where((element) => element.qty > 0)
                  .toList(),
            ),
          )
          .where((team) => team.stickers.isNotEmpty)
          .toList(),
    );
    emit(swaps);
  }
}
