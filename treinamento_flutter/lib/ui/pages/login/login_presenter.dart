abstract class LoginPresenter{
  Stream get emailErrorSteam;
  Stream get passwordErrorSteam;
  Stream get isFormValidErroSteam;



  void validateEmail (String email);
  void validatePassword (String password);

}