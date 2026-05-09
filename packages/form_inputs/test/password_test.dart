import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group('Password validation', () {
    test('valid with a good password', () {
      const password = Password.dirty('VeryGoodPassword1234');
      expect(password.isValid, true);
    });
    test('invalid with a weak password', () {
      const password = Password.dirty('1234');
      expect(password.isValid, false);
    });
  });
}
