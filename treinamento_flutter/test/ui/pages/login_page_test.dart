import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:treinamento_flutter/ui/pages/pages.dart';

void main() {
  testWidgets('Should load with correct initial state',
      (WidgetTester tester) async {
    final loginPage = MaterialApp(home: LoginPage());
    await tester.pumpWidget(loginPage); //renderiza estado inicial da pagina

    final emailTextChildren = find.descendant(
        of: find.bySemanticsLabel('Email'), matching: find.byType(Text));
    expect(emailTextChildren, findsOneWidget, reason: 'when a TextFormField has only text child, means it has no errors, since one of the childs is always the label text');
    
    final button = tester.widget<RaisedButton>(find.byType(RaisedButton));
    expect(button.onPressed, null);
  });
}
