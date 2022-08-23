import 'translations.dart';

class PtBr implements Translations { 
  String get msgInvalidCredentials => 'Credenciais inválidas.';
  String get msgInvalidField => 'Campo inválido.';
  String get msgRequiredField => 'Campo obrigatório.';

  String get addAccount => 'Criar Conta';
  String get email => 'Email';
  String get enter => 'Entrar';
  String get login => 'Login';
  String get password => 'Senha';

}
enum UIError{
  requiredField,
  invalidField,
  unexpected,
  invalidCredentials,
}
