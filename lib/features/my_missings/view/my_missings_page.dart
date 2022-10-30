// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qatar2022_stickers/features/my_missings/my_missings.dart';
import 'package:stickers_repository/stickers_repository.dart';

import '../../../core/widgets/widgets.dart';

class MyMissingsPage extends StatelessWidget {
  const MyMissingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          MyMissingsCubit(context.read<StickersRepository>())..load(),
      child: const MyMissingsView(),
    );
  }
}

class MyMissingsView extends StatelessWidget {
  const MyMissingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyMissingsCubit, Album>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...state.teams.mapIndexed(
                (teamIndex, team) => Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                              color: Colors.grey,
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
        );
      },
    );
  }
}