// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stickers_repository/stickers_repository.dart';

part 'albums_state.dart';

class AlbumsCubit extends Cubit<AlbumsState> {
  AlbumsCubit(this.stickersRepository) : super(const AlbumsState()) {
    stickersRepository.getUserAlbums().then((userAlbums) {
      emit(
        state.copyWith(
          availableAlbums: stickersRepository.availableAlbums(),
          userAlbums: userAlbums,
        ),
      );
    });
  }

  final StickersRepository stickersRepository;

  void changeAlbum(Album album) {
    emit(state.copyWith(selectedAlbum: album));
  }

  Future<void> addAlbum(Album album) async {
    await stickersRepository.saveAlbum(album);
    final albums = await stickersRepository.getUserAlbums();
    emit(state.copyWith(userAlbums: albums));
  }

  void unselectAlbum() {
    emit(
      AlbumsState(
        availableAlbums: state.availableAlbums,
        userAlbums: state.userAlbums,
      ),
    );
  }
}
