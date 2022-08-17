import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import 'package:treinamento_flutter/ui/pages/pages.dart';

class SplashPresenterSpy extends Mock implements SplashPresenter {}
void main() {
  SplashPresenterSpy presenter;
  //2 - criar o controller
  StreamController<String> navigateToController;

  Future<void> loadPage(WidgetTester tester) async {
    //Sempre quando formos testar um widget que depende do material design temos que englobar no pumpWidget a widget em um MaterialApp widget. Também vamos usar rotas, entao por isso tbm o get
    presenter = SplashPresenterSpy();
    //3 - inicializar  o controller
    navigateToController = StreamController<String>();
    //6 - Mockando a Stream para retornar meu controller(fake de teste)
    when(presenter.navigateToStream).thenAnswer((_) => navigateToController.stream);

    await tester.pumpWidget(
      GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashPage(presenter: presenter)),

        //1 - criando a rota de navegação do teste
        GetPage(name: '/any_route', page: () => Scaffold(body: Text('fake page'),))
      ],
    ));
  }
  //4 - fechar o controller dps dos testes
  tearDown((){
    navigateToController.close();
  });

  testWidgets('Should present loading(spinner) on page load',
      (WidgetTester tester) async {
    await loadPage(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Should call loadCurrentAccount on page load',
      (WidgetTester tester) async {
    await loadPage(tester);

    verify(presenter.checkAccount()).called(1);
  });


  testWidgets('Should change page',
      (WidgetTester tester) async {
    await loadPage(tester);

    //criando uma stream e passando um evento para ela (condicao de retorno (retornar uma String com o nome da página que navegaremos, mas no caso estamos testando para qualquer endereco, desde que retorne corretamente))
    navigateToController.add('/any_route');
    await tester.pumpAndSettle();

    //esperamos que a rota atual seja a que mandei navegar acima 
    expect(Get.currentRoute, '/any_route');
    //encontrar tambem um widget com o seguinte texto
    expect(find.text('fake page'), findsOneWidget);
  });

  testWidgets('Should not change page',
      (WidgetTester tester) async {
    await loadPage(tester);
   //Garantir que continue na mesma rota

    //passando uma pagina vazia
    navigateToController.add('');
    await tester.pump();

    //passando nulo
    navigateToController.add(null);
    await tester.pump();

    expect(Get.currentRoute, '/');
  });
}
