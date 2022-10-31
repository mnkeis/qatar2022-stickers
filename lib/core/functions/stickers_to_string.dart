import 'package:stickers_repository/stickers_repository.dart';

String stickersToString(List<Team> teams) {
  return teams
      .map(
        (team) => '${team.code}: ${team.stickers.map(
              (sticker) => '${sticker.index}',
            ).toList().join(', ')}',
      )
      .toList()
      .join('\n');
}
