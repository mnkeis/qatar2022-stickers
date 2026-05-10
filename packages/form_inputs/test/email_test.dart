import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group('Email validation', () {
    test('valid with a user_at_server email', () {
      const email = Email.dirty('user@server');
      expect(email.isValid, true);
    });
    test('valid with a user_at_server_dot_com email', () {
      const email = Email.dirty('user@server.com');
      expect(email.isValid, true);
    });
    test('invalid when address ends with point (.)', () {
      const email = Email.dirty('user@server.');
      expect(email.isValid, false);
    });
    test('invalid when address is missing _at_', () {
      const email = Email.dirty('userserver.com');
      expect(email.isValid, false);
    });
  });
}
