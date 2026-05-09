// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qatar2022_stickers/app/app.dart';
import 'package:qatar2022_stickers/home/cubit/albums_cubit.dart';
import 'package:qatar2022_stickers/l10n/l10n.dart';
import 'package:stickers_repository/stickers_repository.dart';

import '../../features/features.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumsCubit(context.read<StickersRepository>()),
      child: const AlbumSelectionPage(),
    );
  }
}

class AlbumSelectionPage extends StatelessWidget {
  const AlbumSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumsCubit, AlbumsState>(
      builder: (context, state) {
        if (state.selectedAlbum != null) {
          return MyHomePage(state.selectedAlbum!);
        }
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => showDialog<void>(
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: state.availableAlbums
                          .map(
                            (album) => Padding(
                              padding: const EdgeInsets.all(5),
                              child: InkWell(
                                onTap: () {
                                  context.read<AlbumsCubit>().addAlbum(album);
                                  Navigator.of(dialogContext).pop();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    album.name,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              },
            ),
            child: const Icon(Icons.add),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  context.l10n.homePageSelectAlbumTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.userAlbums.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () => context
                              .read<AlbumsCubit>()
                              .changeAlbum(state.userAlbums[index]),
                          child: Text(
                            state.userAlbums[index].name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      );
                    },
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

class MyHomePage extends StatefulWidget {
  const MyHomePage(this.album, {super.key});

  final Album album;

  @override
  State<MyHomePage> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late final List<Widget> _widgetOptions;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      MyAlbumPage(widget.album.id),
      MyStatsPage(widget.album.id),
      MySwapsPage(widget.album.id),
      MyMissingsPage(widget.album.id),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.stickersAppBarTitle),
        actions: [
          IconButton(
            onPressed: () => context.read<AlbumsCubit>().unselectAlbum(),
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () =>
                Navigator.of(context).push(FriendsPage.route(widget.album.id)),
            icon: const Icon(Icons.people),
          ),
          IconButton(
            onPressed: () => context.read<AuthBloc>().add(LogoutRequested()),
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.paste), label: ''),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
