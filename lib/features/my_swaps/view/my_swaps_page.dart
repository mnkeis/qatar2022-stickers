// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qatar2022_stickers/core/functions/stickers_to_string.dart';
import 'package:qatar2022_stickers/features/my_swaps/my_swaps.dart';
import 'package:qatar2022_stickers/l10n/l10n.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stickers_repository/stickers_repository.dart';

import '../../../core/widgets/widgets.dart';

class MySwapsPage extends StatelessWidget {
  const MySwapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MySwapsCubit(context.read<StickersRepository>())..load(),
      child: const MySwapsView(),
    );
  }
}

class MySwapsView extends StatelessWidget {
  const MySwapsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<MySwapsCubit, Album>(
      builder: (context, state) {
        return Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...state.teams.mapIndexed(
                    (teamIndex, team) => Column(
                      children: [
                        Text(
                          '${team.name} [${team.code}]',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Wrap(
                          children: team.stickers
                              .map(
                                (sticker) => StickerView(
                                  index: sticker.index,
                                  count: sticker.qty,
                                  countBox: 0,
                                  color: Colors.red,
                                ),
                              )
                              .toList(),
                        ),
                        const Divider(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 25, bottom: 25),
                child: FloatingActionButton(
                  onPressed: () {
                    final stickers = stickersToString(state.teams);
                    Share.share(
                      '''${l10n.shareSwapsBody}\n\n$stickers\n\n${l10n.messageFooter}''',
                      subject: l10n.shareSwapsSubject,
                    );
                  },
                  child: const Icon(Icons.share),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
