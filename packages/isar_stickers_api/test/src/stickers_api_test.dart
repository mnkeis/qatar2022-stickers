// ignore_for_file: prefer_const_constructors
import 'package:mocktail/mocktail.dart';
import 'package:stickers_api/stickers_api.dart';
import 'package:test/test.dart';

class MockStickersApi extends Mock implements StickersApi {} 

void main() {
  group('TestStickersApi', () {
    test('can be instantiated', () {
      expect(MockStickersApi(), isNotNull);
    });
  });
}
