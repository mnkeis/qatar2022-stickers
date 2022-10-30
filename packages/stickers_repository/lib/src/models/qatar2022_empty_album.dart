import 'package:stickers_api/stickers_api.dart';

/// {@template qatar2022_empty_album}
/// Creates an empty Qatar2022 Album
/// {@endtemplate}
class Qatar2022EmptyAlbum extends Album {
  /// {@macro qatar2022_album}
  Qatar2022EmptyAlbum()
      : super(
          teams: [
            Team.empty(name: 'FIFA World Cup', code: 'FWC', startIndex: 0),
            Team.empty(name: 'Qatar', code: 'QAT'),
            Team.empty(name: 'Ecuador', code: 'ECU'),
            Team.empty(name: 'Senegal', code: 'SEN'),
            Team.empty(name: 'Netherlands', code: 'NED'),
            Team.empty(name: 'England', code: 'ENG'),
            Team.empty(name: 'IR Iran', code: 'IRN'),
            Team.empty(name: 'USA', code: 'USA'),
            Team.empty(name: 'Wales', code: 'WAL'),
            Team.empty(name: 'Argentina', code: 'ARG'),
            Team.empty(name: 'Saudi Arabia', code: 'KSA'),
            Team.empty(name: 'Mexico', code: 'MEX'),
            Team.empty(name: 'Poland', code: 'POL'),
            Team.empty(name: 'France', code: 'FRA'),
            Team.empty(name: 'Australia', code: 'AUS'),
            Team.empty(name: 'Denmark', code: 'DEN'),
            Team.empty(name: 'Tunisia', code: 'TUN'),
            Team.empty(name: 'Spain', code: 'ESP'),
            Team.empty(name: 'Costa Rica', code: 'CRC'),
            Team.empty(name: 'Germany', code: 'GER'),
            Team.empty(name: 'Japan', code: 'JPN'),
            Team.empty(name: 'Belgium', code: 'BEL'),
            Team.empty(name: 'Canada', code: 'CAN'),
            Team.empty(name: 'Morocco', code: 'MAR'),
            Team.empty(name: 'Croatia', code: 'CRO'),
            Team.empty(name: 'Brazil', code: 'BRA'),
            Team.empty(name: 'Serbia', code: 'SRB'),
            Team.empty(name: 'Switzerland', code: 'SUI'),
            Team.empty(name: 'Cameroon', code: 'CMR'),
            Team.empty(name: 'Portugal', code: 'POR'),
            Team.empty(name: 'Ghana', code: 'GHA'),
            Team.empty(name: 'Uruguay', code: 'URU'),
            Team.empty(name: 'Korea Republic', code: 'KOR'),
            Team.empty(
              name: 'FWC Muesum',
              code: 'FWC',
              length: 11,
              startIndex: 19,
            ),
          ],
        );
}
