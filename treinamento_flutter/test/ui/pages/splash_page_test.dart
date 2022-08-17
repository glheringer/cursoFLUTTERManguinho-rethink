import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/route_manager.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('4Dev')),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

void main() {
  Future<void> loadPage(WidgetTester tester) async {
    //Sempre quando formos testar um widget que depende do material design temos que englobar no pumpWidget a widget em um MaterialApp widget. Também vamos usar rotas, entao por isso tbm o get
    await tester.pumpWidget(GetMaterialApp(
      initialRoute: '/',
      getPages: [GetPage(name: '/', page: () => SplashPage())],
    ));
  }

  testWidgets('Should present loading(spinner) on page load', (WidgetTester tester) async {
    await loadPage(tester);
    
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
