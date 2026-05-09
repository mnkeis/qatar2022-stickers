import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friends_repository/friends_repository.dart';
import 'package:qatar2022_stickers/core/widgets/widgets.dart';
import 'package:qatar2022_stickers/l10n/l10n.dart';
import 'package:stickers_repository/stickers_repository.dart';

import '../cubit/friend_swaps_cubit.dart';

class FriendSwapsPage extends StatelessWidget {
  const FriendSwapsPage({
    required this.friend,
    super.key,
  });

  final Friend friend;

  static Route<void> route(Friend friend) {
    return MaterialPageRoute<void>(
      builder: (_) => FriendSwapsPage(
        friend: friend,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FriendSwapsCubit(
        stickersRepository: context.read<StickersRepository>(),
        friend: friend,
      )..load(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.friendSwapsAppBarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  '${context.l10n.friendSwapsTitle} ${friend.name}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                const FriendSwapsView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FriendSwapsView extends StatelessWidget {
  const FriendSwapsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<FriendSwapsCubit, FriendSwapsState>(
      listener: (context, state) {
        if (state is FriendSwapsError) {
          showDialog<void>(
            context: context,
            builder: (context) => ErrorDialog(
              message: l10n.friendSwapsFriendFailure,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is FriendSwapsLoaded) {
          final total = state.stickersToGet.length < state.stickersToGive.length
              ? state.stickersToGet.length
              : state.stickersToGive.length;
          return Column(
            children: [
              Text(
                '${l10n.totalSwapQty}: $total',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          l10n.availableToGet,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        ...state.stickersToGet
                            .map(
                              (sticker) => StickerView(
                                count: 1,
                                index: sticker.index,
                                countBox: 1,
                                teamCode: sticker.teamCode,
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          l10n.availableToGive,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        ...state.stickersToGive
                            .map(
                              (sticker) => StickerView(
                                count: 1,
                                index: sticker.index,
                                countBox: 1,
                                color: Colors.red,
                                teamCode: sticker.teamCode,
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        }
        if (state is FriendSwapsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    );
  }
}
