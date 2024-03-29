import 'package:flutter_test/flutter_test.dart';

import 'package:treinamento_flutter/presentation/protocols/protocols.dart';
import 'package:treinamento_flutter/validation/validators/validators.dart';



void main() {
  RequiredFieldValidation sut;

  setUp(() {
    sut = RequiredFieldValidation('any_field');
  });

  test('Should return null if value is not empty', () {
    expect(sut.validate('any_value'), null);
  });

  test('Should return null if value is empty', () {
    expect(sut.validate(''), ValidationError.requiredField);
  });

  test('Should return null if value is null', () {
    expect(sut.validate(''), ValidationError.requiredField);
  });
}
