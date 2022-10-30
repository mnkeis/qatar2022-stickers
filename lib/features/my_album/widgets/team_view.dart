import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stickers_repository/stickers_repository.dart';

import '../../../core/widgets/widgets.dart';
import '../my_album.dart';

class TeamView extends StatelessWidget {
  const TeamView({
    super.key,
    required this.team,
    required this.teamIndex,
  });

  final Team team;
  final int teamIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${team.name} [${team.code}]',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Wrap(
          children: team.stickers
              .mapIndexed(
                (index, sticker) => StickerView(
                  index: sticker.index,
                  count: sticker.qty,
                  countBox: 1,
                  increment: () => context.read<MyAlbumCubit>().increment(
                        value: sticker.qty,
                        stickerIndex: index,
                        teamIndex: teamIndex,
                      ),
                  decrement: () => context.read<MyAlbumCubit>().decrement(
                        value: sticker.qty,
                        stickerIndex: index,
                        teamIndex: teamIndex,
                      ),
                ),
              )
              .toList(),
        ),
        const Divider(),
      ],
    );
  }
}
