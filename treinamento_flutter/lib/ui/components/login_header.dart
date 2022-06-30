import 'package:flutter/material.dart';

class LoginHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          //Criar cores em degradê
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).primaryColorLight,
            Theme.of(context).primaryColorDark,
          ],
        ),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 0),
              spreadRadius: 0,
              blurRadius: 4,
              color: Colors.black),
        ],
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
      ),
      child: Image(
        // color: Colors.black,
        image: AssetImage('lib/ui/assets/logo.png'),
      ),
    );
  }
}
