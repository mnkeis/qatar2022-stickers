import 'package:stickers_api/stickers_api.dart';

/// {@template conmebol_copa_america_usa_2024_empty_album}
/// Creates an empty Conmebol Copa America 2024 Album
/// {@endtemplate}
class ConmebolCopaAmericaUsa2024EmptyAlbum extends Album {
  /// {@macro qatar2022_album}
  ConmebolCopaAmericaUsa2024EmptyAlbum()
      : super(
          id: '',
          name: 'Conmebol Copa America USA 2024',
          teams: [
            Team.empty(
              name: 'Conmebol Copa America USA 2024',
              code: 'INTR',
              length: 4,
            ),
            Team.empty(name: 'Venues and Stadiums', code: 'HCI', length: 10),
            Team.empty(name: 'Argentina', code: 'ARG', length: 22),
            Team.empty(name: 'Perú', code: 'PER', length: 22),
            Team.empty(name: 'Chile', code: 'CHI', length: 22),
            Team.empty(name: 'México', code: 'MEX', length: 22),
            Team.empty(name: 'Ecuador', code: 'ECU', length: 22),
            Team.empty(name: 'Venezuela', code: 'VEN', length: 22),
            Team.empty(name: 'Jamaica', code: 'JAM', length: 22),
            Team.empty(name: 'USA', code: 'USA', length: 22),
            Team.empty(name: 'Uruguay', code: 'URU', length: 22),
            Team.empty(name: 'Panamá', code: 'PAN', length: 22),
            Team.empty(name: 'Bolivia', code: 'BOL', length: 22),
            Team.empty(name: 'Brasil', code: 'BRA', length: 22),
            Team.empty(name: 'Colombia', code: 'COL', length: 22),
            Team.empty(name: 'Paraguay', code: 'PAR', length: 22),
            Team.empty(name: 'Canada', code: 'CAN', length: 22),
            Team.empty(name: 'Costa Rica', code: 'CRC', length: 22),
            Team.empty(name: 'Honduras', code: 'HON', length: 22),
            Team.empty(name: 'Trinidad And Tobago', code: 'TRI', length: 22),
            Team.empty(name: 'Legends', code: 'LEG', length: 18),
            Team.empty(name: 'Roll Of Honour', code: 'ROH', length: 2),
          ],
        );
}
