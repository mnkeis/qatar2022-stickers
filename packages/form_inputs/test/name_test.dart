import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group('Name validation', () {
    test('valid with a non empty name', () {
      const name = Name.dirty('aa');
      expect(name.valid, true);
    });
    test('invalid with an empty name', () {
      const name = Name.dirty();
      expect(name.valid, false);
    });
    test('invalid with a single character name', () {
      const name = Name.dirty('a');
      expect(name.valid, false);
    });
  });
}
