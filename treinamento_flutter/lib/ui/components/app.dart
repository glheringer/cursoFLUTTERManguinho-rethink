import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treinamento_flutter/ui/pages/login/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light); //Mudando a status bar do iphone para branca

    //Essa vai ser minha Main que eu usava anteriormente, apenas com outro nome
    final primaryColor = Color.fromARGB(255, 136, 14, 79);
    final primaryColorDark = Color.fromARGB(255, 96, 0, 39);
    final primaryColorLight = Color.fromARGB(255, 181, 71, 123);

    return MaterialApp(
      title: '4Dev',
      debugShowCheckedModeBanner: false,
      home: LoginPage(null),
      theme: ThemeData(
          primaryColor: primaryColor,
          primaryColorDark: primaryColorDark,
          primaryColorLight: primaryColorLight,
          accentColor: primaryColor,
          backgroundColor: Colors.white,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: primaryColorDark,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: primaryColorLight)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: primaryColor)),
            alignLabelWithHint:
                true, //Dá uma melhor alinhada do texto com o form
          ),
          buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.light(primary: primaryColor),
              buttonColor: primaryColor,
              splashColor: primaryColorLight,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                  ),
            ),
          ),
    );
  }
}
