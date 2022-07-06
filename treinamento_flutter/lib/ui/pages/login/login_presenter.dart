abstract class LoginPresenter{
  Stream get emailErrorSteam;
  Stream get passwordErrorSteam;


  void validateEmail (String email);
  void validatePassword (String password);

}