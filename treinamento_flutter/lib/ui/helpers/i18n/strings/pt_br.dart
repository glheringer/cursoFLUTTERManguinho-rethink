import 'translations.dart';

class PtBr implements Translations {
  String get msgEmailInUse => 'Email em uso.';
  String get msgInvalidCredentials => 'Credenciais inválidas.';
  String get msgInvalidField => 'Campo inválido.';
  String get msgRequiredField => 'Campo obrigatório.';

  String get addAccount => 'Criar conta';
  String get confirmPassword => 'Confirmar senha';
  String get email => 'Email';
  String get enter => 'Entrar';
  String get login => 'Login';
  String get name => 'Nome';
  String get password => 'Senha';
}

enum UIError {
  requiredField,
  invalidField,
  unexpected,
  invalidCredentials,
}
