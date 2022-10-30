// ignore_for_file: prefer_const_constructors
import 'package:auth_repository/auth_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class TestAuthApi extends Mock implements AuthApi {}

void main() {
  final testAuthRepositoryApi = TestAuthApi();
  group('AuthRepositoryRepository', () {
    test('can be instantiated', () {
      expect(AuthRepository(testAuthRepositoryApi), isNotNull);
    });
  });
}
