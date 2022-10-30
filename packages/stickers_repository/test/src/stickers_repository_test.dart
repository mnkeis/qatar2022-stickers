// ignore_for_file: prefer_const_constructors
import 'package:mocktail/mocktail.dart';
import 'package:stickers_repository/stickers_repository.dart';
import 'package:test/test.dart';

class MockStickersApi extends Mock implements StickersApi {} 

void main() {
  final testStickersApi = MockStickersApi();
  group('StickersRepository', () {
    test('can be instantiated', () {
      expect(StickersRepository(testStickersApi), isNotNull);
    });
  });
}
