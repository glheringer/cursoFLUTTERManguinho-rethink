import 'translations.dart';

class PtBr implements Translations { 
  String get addAccount => 'Criar Conta';
}
enum UIError{
  requiredField,
  invalidField,
  unexpected,
  invalidCredentials,
}
