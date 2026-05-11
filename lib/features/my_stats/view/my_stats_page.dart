// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:album_master/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stickers_repository/stickers_repository.dart';

import '../../features.dart';

class MyStatsPage extends StatelessWidget {
  const MyStatsPage(this.albumId, {super.key});

  final String albumId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          MyStatsCubit(context.read<StickersRepository>())..load(albumId),
      child: const MyStatsView(),
    );
  }
}

class MyStatsView extends StatelessWidget {
  const MyStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final iconColor = Theme.of(context).colorScheme.primary;
    return BlocBuilder<MyStatsCubit, MyStatsState>(
      builder: (context, state) {
        final stats = [
          _StatData(
            value: '${state.totalStickers}',
            label: l10n.statsTotalsLabel,
            icon: Icons.collections,
            iconColor: iconColor,
          ),
          _StatData(
            value: '${state.missingStickers}',
            label: l10n.statsMissingLabel,
            icon: Icons.remove_circle_outline,
            iconColor: Colors.redAccent,
          ),
          _StatData(
            value: '${state.collectedStickers}',
            label: l10n.statsCollectedLabel,
            icon: Icons.check_circle_outline,
            iconColor: Colors.green,
          ),
          _StatData(
            value: '${state.swapStickers}',
            label: l10n.statsSwapLabel,
            icon: Icons.swap_horiz,
            iconColor: Colors.orange,
          ),
          _StatData(
            value: '${state.completedPercent}%',
            label: l10n.statsPercentLabel,
            icon: Icons.percent,
            iconColor: Colors.blueAccent,
          ),
        ];
        return Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.3,
            ),
            itemCount: stats.length,
            itemBuilder: (context, index) {
              final stat = stats[index];
              return StatsCard(
                value: stat.value,
                label: stat.label,
                icon: stat.icon,
                iconColor: stat.iconColor,
              );
            },
          ),
        );
      },
    );
  }
}

class _StatData {
  _StatData({
    required this.value,
    required this.label,
    required this.icon,
    required this.iconColor,
  });
  final String value;
  final String label;
  final IconData icon;
  final Color iconColor;
}

class StatsCard extends StatelessWidget {
  const StatsCard({
    required this.value,
    required this.label,
    required this.icon,
    required this.iconColor,
    super.key,
  });

  final String value;
  final String label;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxHeight < 180;
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: isNarrow ? 10 : 18,
              horizontal: isNarrow ? 6 : 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: CircleAvatar(
                    backgroundColor: iconColor.withValues(alpha: .1),
                    radius: isNarrow ? 18 : 28,
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: isNarrow ? 22 : 32,
                    ),
                  ),
                ),
                SizedBox(height: isNarrow ? 8 : 16),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      value,
                      style: Theme.of(context).textTheme.displayMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: isNarrow ? 4 : 8),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      label,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
