import 'package:treinamento_flutter/main/builders/validation_builder.dart';

import '../../../../validation/protocols/protocols.dart';

import '../../../../presentation/protocols/validation.dart';

import '../../../../validation/validators/validators.dart';

Validation makeLoginValidation() {

  return ValidationComposite(makeLoginValidations());

}
List<FieldValidation> makeLoginValidations(){
  return[
    ...ValidationBuilder.field('email').required().email().build(),
    ...ValidationBuilder.field('password').required().build(),

  ];  
} 