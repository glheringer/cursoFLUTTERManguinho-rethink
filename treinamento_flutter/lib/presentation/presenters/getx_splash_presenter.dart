import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../domain/usescases/usecases.dart';
import '../../ui/pages/pages.dart';

class GetxSplashPresenter implements SplashPresenter {
  final LoadCurrentAccount loadCurrentAccount;

  final _navigateTo = RxString();

  Stream<String> get navigateToStream => _navigateTo.stream;

  GetxSplashPresenter({@required this.loadCurrentAccount});

  Future<void> checkAccount({int durationInSeconds = 2}) async {
    await Future.delayed(Duration(seconds: durationInSeconds));
    try {
      final account = await loadCurrentAccount.load();
      _navigateTo.value = !account.isNull ? '/login' : '/surveys'; //Remover o ! para ir para a tela de surveys
    } catch(error) {
      _navigateTo.value = '/login';
    }
  }
}