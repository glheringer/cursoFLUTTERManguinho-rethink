import '../../../../presentation/presenters/presenters.dart';

import '../../../../ui/pages/pages.dart';

import '../../factories.dart';

// LoginPresenter makeStreamLoginPresenter() {
//   return StreamLoginPresenter(
//       authentication: makeRemoteAuthentication(),
//       validation: makeLoginValidation());
// }

SplashPresenter makeGetxSplashPresenter() {
  return GetxSplashPresenter(loadCurrentAccount: makeLocalLoadCurrentAccount());
}
