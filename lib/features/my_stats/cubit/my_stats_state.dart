part of 'my_stats_cubit.dart';

class MyStatsState {
  const MyStatsState({
    this.totalStickers = 0,
    this.collectedStickers = 0,
    this.swapStickers = 0,
    this.missingStickers = 0,
    this.completedPercent = '0',
  });

  final int totalStickers;
  final int collectedStickers;
  final int swapStickers;
  final int missingStickers;
  final String completedPercent;
}
