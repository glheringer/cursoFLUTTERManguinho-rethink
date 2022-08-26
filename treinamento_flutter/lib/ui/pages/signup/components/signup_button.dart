import 'package:flutter/material.dart';
import 'package:treinamento_flutter/ui/helpers/helpers.dart';



class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: null,
      child: Text(R.strings.addAccount.toUpperCase()),
    );
  }
}
