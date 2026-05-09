part of 'albums_cubit.dart';

class AlbumsState extends Equatable {
  const AlbumsState({
    this.availableAlbums = const [],
    this.userAlbums = const [],
    this.selectedAlbum,
  });

  final List<Album> availableAlbums;
  final List<Album> userAlbums;
  final Album? selectedAlbum;

  AlbumsState copyWith({
    List<Album>? availableAlbums,
    List<Album>? userAlbums,
    Album? selectedAlbum,
  }) =>
      AlbumsState(
        availableAlbums: availableAlbums ?? this.availableAlbums,
        userAlbums: userAlbums ?? this.userAlbums,
        selectedAlbum: selectedAlbum ?? this.selectedAlbum,
      );

  @override
  List<Object?> get props => [
        availableAlbums,
        userAlbums,
        selectedAlbum,
      ];
}
