import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:meta/meta.dart';

class SplashPage extends StatelessWidget {
  final SplashPresenter presenter; 

  SplashPage({@required this.presenter});

  @override
  Widget build(BuildContext context) {
    presenter.loadCurrentAccount();
    
    return Scaffold(
      appBar: AppBar(title: Text('4Dev')),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

abstract class SplashPresenter {
  Future<void> loadCurrentAccount();
}

class SplashPresenterSpy extends Mock implements SplashPresenter {}

void main() {
  SplashPresenterSpy presenter;

  Future<void> loadPage(WidgetTester tester) async {
    //Sempre quando formos testar um widget que depende do material design temos que englobar no pumpWidget a widget em um MaterialApp widget. Também vamos usar rotas, entao por isso tbm o get

    presenter = SplashPresenterSpy();
    await tester.pumpWidget(GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashPage(presenter: presenter))
      ],
    ));
  }

  testWidgets('Should present loading(spinner) on page load',
      (WidgetTester tester) async {
    await loadPage(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Should call loadCurrentAccount on page load',
      (WidgetTester tester) async {
    await loadPage(tester);

    verify(presenter.loadCurrentAccount()).called(1);
  });
}
