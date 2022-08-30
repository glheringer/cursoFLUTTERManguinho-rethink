import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../ui/helpers/errors/ui_error.dart';

import '../protocols/protocols.dart';

class GetxSignUpPresenter extends GetxController{
  final Validation validation;
  String _email;
  String _password;
  var _emailError = Rx<UIError>();
  var _passwordError = Rx<UIError>();
  var _isFormValid = false.obs;

  Stream<UIError> get emailErrorStream => _emailError.stream;
  Stream<UIError> get passwordErrorStream => _passwordError.stream;
  Stream<bool> get isFormValidStream => _isFormValid.stream;

  GetxSignUpPresenter(
      {@required this.validation});

  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField(field: 'email', value: email);
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    _passwordError.value =
        _validateField(field: 'password', value: password);
    _validateForm();
  }
  UIError _validateField ({String field, String value}) {
    final error = validation.validate(field: field, value: value);
    switch(error){
      case ValidationError.invalidField: return UIError.invalidField;
      break;
      case ValidationError.requiredField:
        return UIError.requiredField;
        break;
      default: return null;
    }

  }
  void _validateForm() {
    _isFormValid.value = false;
  }
}