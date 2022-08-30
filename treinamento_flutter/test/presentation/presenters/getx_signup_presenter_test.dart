import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:treinamento_flutter/presentation/presenters/presenters.dart';

import 'package:treinamento_flutter/ui/helpers/errors/errors.dart';


import 'package:treinamento_flutter/presentation/protocols/protocols.dart';

class ValidationSpy extends Mock implements Validation {}
void main() {
  GetxSignUpPresenter sut;
  ValidationSpy validation;
  String email;
  String password;

  PostExpectation mockValiditionCall(String field) => when(validation.validate(
      field: field == null ? anyNamed('field') : field,
      value: anyNamed('value')));

  void mockValidation({String field, ValidationError value}) {
    mockValiditionCall(field).thenReturn(value);
  }


  setUp(() {
    validation = ValidationSpy();
    sut = GetxSignUpPresenter(validation : validation);

    email = faker.internet.email();
    password = faker.internet.password();

    mockValidation();
  });
  test('Should call Validation with correct email', () {
    sut.validateEmail(email);

    verify(validation.validate(field: 'email', value: email)).called(1);
  });

  test('Should emit invalidFieldError if invalid', () {
    mockValidation(value: ValidationError.invalidField);

    sut.emailErrorStream
        .listen(expectAsync1((error) => expect(error, UIError.invalidField)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should emit requiredFieldError if email is empty', () {
    mockValidation(value: ValidationError.requiredField);

    sut.emailErrorStream
        .listen(expectAsync1((error) => expect(error, UIError.requiredField)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should emit null if validation succeeds', () {
    sut.emailErrorStream.listen(expectAsync1((error) => expect(error, null)));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  // test('Should call Validation with correct password', () {
  //   sut.validatePassword(password);

  //   verify(validation.validate(field: 'password', value: password)).called(1);
  // });

  // test('Should emit requiredFieldError if password is empty', () {
  //   mockValidation(value: ValidationError.requiredField);

  //   sut.passwordErrorStream
  //       .listen(expectAsync1((error) => expect(error, UIError.requiredField)));
  //   sut.isFormValidStream
  //       .listen(expectAsync1((isValid) => expect(isValid, false)));

  //   sut.validatePassword(password);
  //   sut.validatePassword(password);
  // });

  // test('Should emit null if validation succeeds', () {
  //   sut.passwordErrorStream
  //       .listen(expectAsync1((error) => expect(error, null)));
  //   sut.isFormValidStream
  //       .listen(expectAsync1((isValid) => expect(isValid, false)));

  //   sut.validatePassword(password);
  //   sut.validatePassword(password);
  // });
}
