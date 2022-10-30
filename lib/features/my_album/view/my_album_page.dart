// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stickers_repository/stickers_repository.dart';

import '../../features.dart';
import '../widgets/widgets.dart';

class MyAlbumPage extends StatelessWidget {
  const MyAlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyAlbumCubit(context.read<StickersRepository>())..load(),
      child: const MyAlbumView(),
    );
  }
}

class MyAlbumView extends StatefulWidget {
  const MyAlbumView({super.key});

  @override
  State<MyAlbumView> createState() => _MyAlbumViewState();
}

class _MyAlbumViewState extends State<MyAlbumView> {
  int _currentTeam = 0;
  final ItemScrollController _scrollController = ItemScrollController();
  final ItemPositionsListener _positionsListener =
      ItemPositionsListener.create();

  void animateToIndex(int index) {
    if (kIsWeb) {
      _scrollController.jumpTo(
        index: index,
      );
    } else {
      _scrollController.jumpTo(
        index: index,
        alignment: 0.1,
      );
    }
  }

  @override
  void initState() {
    _positionsListener.itemPositions.addListener(() {
      final values = _positionsListener.itemPositions.value;
      final index = values.first.index < values.last.index
          ? values.first.index
          : values.last.index;
      if (kIsWeb) {
        if (index != _currentTeam) {
          setState(() {
            _currentTeam = index;
          });
        }
      } else {
        if (index != _currentTeam && index > 0) {
          setState(() {
            _currentTeam = index - 1;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<MyAlbumCubit, Album>(
        builder: (context, state) {
          if (state.teams.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (kIsWeb) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TeamSelection(
                  teams: state.teams,
                  selectedTeam: state.teams[_currentTeam],
                  onChanged: (team) {
                    if (team != null) {
                      final index = state.teams.indexOf(team);
                      animateToIndex(index);
                      setState(() {
                        _currentTeam = index;
                      });
                    }
                  },
                ),
                Expanded(
                  child: ScrollablePositionedList.builder(
                    shrinkWrap: true,
                    itemScrollController: _scrollController,
                    itemPositionsListener: _positionsListener,
                    itemCount: state.teams.length,
                    itemBuilder: (context, teamIndex) {
                      final team = state.teams[teamIndex];
                      return TeamView(team: team, teamIndex: teamIndex);
                    },
                  ),
                ),
              ],
            );
          }
          return Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Expanded(
                child: ScrollablePositionedList.builder(
                  shrinkWrap: true,
                  itemScrollController: _scrollController,
                  itemPositionsListener: _positionsListener,
                  itemCount: state.teams.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const SizedBox(height: 70);
                    } else {
                      final teamIndex = index - 1;
                      final team = state.teams[teamIndex];
                      return TeamView(team: team, teamIndex: teamIndex);
                    }
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: ColoredBox(
                      color: Colors.white.withOpacity(0.2),
                      child: TeamSelection(
                        teams: state.teams,
                        selectedTeam: state.teams[_currentTeam],
                        onChanged: (team) {
                          if (team != null) {
                            final index = state.teams.indexOf(team);
                            animateToIndex(index + 1);
                            setState(() {
                              _currentTeam = index;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class TeamSelection extends StatelessWidget {
  const TeamSelection({
    required this.teams,
    this.selectedTeam,
    this.onChanged,
    super.key,
  });

  final List<Team> teams;
  final Team? selectedTeam;
  final void Function(Team?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: DropdownButton(
          underline: const SizedBox.shrink(),
          icon: const Icon(null),
          value: selectedTeam,
          items: teams
              .map(
                (e) => DropdownMenuItem<Team>(
                  alignment: Alignment.center,
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text('${e.name} [${e.code}]'),
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
