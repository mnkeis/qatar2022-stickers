// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:local_storage_stickers_api/local_storage_stickers_api.dart';
import 'package:qatar2022_stickers/bootstrap.dart';
import 'package:qatar2022_stickers/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stickers_repository/stickers_repository.dart';

import 'l10n/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final stickersApi = LocalStorageStickersApi(sharedPreferences);
  await bootstrap(
    () => MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => StickersRepository(stickersApi),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const MyHomePage(),
      ),
    ),
  );
}
