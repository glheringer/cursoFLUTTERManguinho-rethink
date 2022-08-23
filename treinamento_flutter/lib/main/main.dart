import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:treinamento_flutter/ui/helpers/helpers.dart';



import '../ui/components/components.dart';

import './factories/factories.dart';



void main(){
  // R.load(Locale('en','Us'));
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light); //Mudando a status bar do iphone para branca

    
    return GetMaterialApp(
      title: '4Dev',
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: makeSplashPage, transition: Transition.fade),
        GetPage(name: '/login', page: makeLoginPage, transition: Transition.fadeIn),
        GetPage(name: '/surveys', page: () => Scaffold(body: Text('Enquetes'),), transition: Transition.fadeIn),
      ],
    );
  }
}