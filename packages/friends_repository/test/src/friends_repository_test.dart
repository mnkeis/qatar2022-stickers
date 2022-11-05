// ignore_for_file: prefer_const_constructors
import 'package:friends_api/friends_api.dart';
import 'package:friends_repository/friends_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockFriendsApi extends Mock implements FriendsApi {} 

void main() {
  final testFriendsApi = MockFriendsApi();
  group('FriendsRepository', () {
    test('can be instantiated', () {
      expect(FriendsRepository(testFriendsApi), isNotNull);
    });
  });
}
