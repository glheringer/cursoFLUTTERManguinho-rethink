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
    //manda para a pagina de surveys
    _navigateTo.value = '/surveys';
  }
}

class LoadCurrentAccountSpy extends Mock implements LoadCurrentAccount {}

void main() {
  GetxSplashPresenter sut;
  LoadCurrentAccountSpy loadCurrentAccount;

  setUp(() {
    loadCurrentAccount = LoadCurrentAccountSpy();
    sut = GetxSplashPresenter(loadCurrentAccount: loadCurrentAccount);
  });
  test('Should call LoadCurrentAccount', () async {
    await sut.checkAccount();

    verify(loadCurrentAccount.load()).called(1);
  });

  test('Should go to surveys page on sucess', () async {
    //testando a stream para ver se esta realmente mandando para surveys
    sut.navigateToStream.listen(expectAsync1((page) => expect(page, '/surveys')));
    
    await sut.checkAccount();
  });
}
