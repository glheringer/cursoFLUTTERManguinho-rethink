abstract class LoginPresenter{
  Stream get emailErrorSteam;
  
  void validateEmail (String email);
  void validatePassword (String password);

}