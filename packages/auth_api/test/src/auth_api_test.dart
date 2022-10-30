// ignore_for_file: prefer_const_constructors
import 'package:auth_api/auth_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class TestAuthApi extends Mock implements AuthApi {}

void main() {
  group('TestAuthRepositoryApi', () {
    test('can be instantiated', () {
      expect(TestAuthApi(), isNotNull);
    });
  });
}
