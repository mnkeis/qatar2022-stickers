// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:auth_repository/auth_repository.dart';
import 'package:firebase_auth_api/firebase_auth_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:local_storage_stickers_api/local_storage_stickers_api.dart';
import 'package:qatar2022_stickers/app/app.dart';
import 'package:qatar2022_stickers/bootstrap.dart';
import 'package:rtdb_stickers_api/rtdb_stickers_api.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:stickers_repository/stickers_repository.dart';

import 'firebase_options_dev.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final sharedPreferences = await SharedPreferences.getInstance();
  // final stickersApi = LocalStorageStickersApi(sharedPreferences);
  await bootstrap(
    () => MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AuthRepository(FirebaseAuthApi())),
        RepositoryProvider(create: (_) => StickersRepository(RtdbStickersApi()))
      ],
      child: const App(),
    ),
  );
}
