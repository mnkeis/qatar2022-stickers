import 'package:friends_api/friends_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockFriendsApi extends Mock implements FriendsApi {}

void main() {
  group('TestFriendsApi', () {
    test('can be instantiated', () {
      expect(MockFriendsApi(), isNotNull);
    });
  });
}
