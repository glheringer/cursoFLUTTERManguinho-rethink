import '../../../../validation/protocols/protocols.dart';

import '../../../../presentation/protocols/validation.dart';

import '../../../../validation/validators/validators.dart';

Validation makeLoginValidation() {

  return ValidationComposite(makeLoginValidations());

}
List<FieldValidation> makeLoginValidations(){
  return[
    RequiredFieldValidation('email'),
    EmailValidation('email'),
    RequiredFieldValidation('password')
  ];  
}