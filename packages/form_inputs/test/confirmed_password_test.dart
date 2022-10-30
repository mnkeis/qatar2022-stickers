import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group('ConfirmedPassword validation', () {
    test('valid if match password', () {
      const password = Password.dirty('12345678');
      final confirmedPassword =
          ConfirmedPassword.dirty(password: password.value, value: '12345678');
      expect(confirmedPassword.valid, true);
    });
    test('invalid if do not match password', () {
      const password = Password.dirty('12345678');
      final confirmedPassword =
          ConfirmedPassword.dirty(password: password.value, value: '123456');
      expect(confirmedPassword.valid, false);
    });
  });
}
