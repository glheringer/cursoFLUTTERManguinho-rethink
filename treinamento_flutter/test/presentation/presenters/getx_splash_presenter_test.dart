import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:meta/meta.dart';

import 'package:treinamento_flutter/domain/usescases/load_current_account.dart';
import 'package:treinamento_flutter/ui/pages/splash/splash.dart';

class GetxSplashPresenter implements SplashPresenter {
  var _navigateTo = RxString();
  final LoadCurrentAccount loadCurrentAccount;

  GetxSplashPresenter({@required this.loadCurrentAccount});

  Stream<String> get navigateToStream => _navigateTo.stream;

  Future<void> checkAccount() async {
    await loadCurrentAccount.load();
  }
}

class LoadCurrentAccountSpy extends Mock implements LoadCurrentAccount {}

void main() {
  test('Should call LoadCurrentAccount', () async {
    final loadCurrentAccount = LoadCurrentAccountSpy();
    final sut = GetxSplashPresenter(loadCurrentAccount: loadCurrentAccount);

    await sut.checkAccount();
    
    verify(loadCurrentAccount.load()).called(1);
  });
}
