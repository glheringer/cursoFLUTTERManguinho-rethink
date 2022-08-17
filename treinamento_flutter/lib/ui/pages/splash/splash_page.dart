import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_presenter.dart';

class SplashPage extends StatelessWidget {
  final SplashPresenter presenter; 

  SplashPage({@required this.presenter});

  @override
  Widget build(BuildContext context) {
    presenter.checkAccount();

    return Scaffold(
      appBar: AppBar(title: Text('4Dev')),
      body: Builder(
        builder: (context){
            //8 - Ouvir a Stream
            presenter.navigateToStream.listen((page) {
              //9 - Criar a navegacao em si
               if (page?.isNotEmpty == true) {
                 Get.offAllNamed(page);
                }
            });
          return Center(
             child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}