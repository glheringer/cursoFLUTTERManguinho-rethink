import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../domain/usescases/usecases.dart';
import '../../ui/pages/pages.dart';

class GetxSplashPresenter implements SplashPresenter {
  var _navigateTo = RxString();
  final LoadCurrentAccount loadCurrentAccount;

  GetxSplashPresenter({@required this.loadCurrentAccount});

  Stream<String> get navigateToStream => _navigateTo.stream;

  Future<void> checkAccount() async {
    await Future.delayed(Duration(seconds: 2));
    try {
      final account = await loadCurrentAccount.load();
      //fazendo a navegação
      _navigateTo.value = !account.isNull ? '/login' : '/surveys'; //remover ! para ir a tela de survey
    } catch (error) {
      //caso de error mandar para tela de login
      _navigateTo.value = '/login';
    }
  }
}