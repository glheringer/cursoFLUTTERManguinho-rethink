import '../helpers.dart';

enum UIError { unexpected, requiredField, invalidField, invalidCredentials }

extension UIErrorExtension on UIError {
  String get description {
    switch (this) {
      case UIError.requiredField:
        return R.strings.msgRequiredField;
      case UIError.invalidField:
        return R.strings.msgInvalidField;
      case UIError.invalidCredentials:
        return R.strings.msgInvalidCredentials;
      default:
        return 'Algo errado aconteceu. Tente novamente em breve.';
    }
  }
}