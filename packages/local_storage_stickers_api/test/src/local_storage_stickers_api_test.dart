// ignore_for_file: prefer_const_constructors
import 'package:local_storage_stickers_api/local_storage_stickers_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  final sharedPrefrences = MockSharedPreferences();
  group('LocalStorageStickersApi', () {
    test('can be instantiated', () {
      expect(LocalStorageStickersApi(sharedPrefrences), isNotNull);
    });
  });
}
