// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qatar2022_stickers/l10n/l10n.dart';
import 'package:stickers_repository/stickers_repository.dart';

import '../../features.dart';

class MyStatsPage extends StatelessWidget {
  const MyStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyStatsCubit(context.read<StickersRepository>())..load(),
      child: const MyStatsView(),
    );
  }
}

class MyStatsView extends StatelessWidget {
  const MyStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<MyStatsCubit, MyStatsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<MyStatsCubit, MyStatsState>(
            builder: (context, state) => Wrap(
              children: [
                StatsCard(
                  value: '${state.totalStickers}',
                  label: l10n.statsTotalsLabel,
                ),
                StatsCard(
                  value: '${state.missingStickers}',
                  label: l10n.statsMissingLabel,
                ),
                StatsCard(
                  value: '${state.collectedStickers}',
                  label: l10n.statsCollectedLabel,
                ),
                StatsCard(
                  value: '${state.swapStickers}',
                  label: l10n.statsSwapLabel,
                ),
                StatsCard(
                  value: '${state.completedPercent}%',
                  label: l10n.statsPercentLabel,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class StatsCard extends StatelessWidget {
  const StatsCard({
    required this.value,
    required this.label,
    super.key,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
