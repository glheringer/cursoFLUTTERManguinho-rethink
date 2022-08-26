import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_flutter/ui/helpers/helpers.dart';

import '../../../../ui/helpers/errors/ui_error.dart';

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: R.strings.password,
        icon: Icon(
          Icons.lock,
          color: Theme.of(context).primaryColorLight,
        ),
      ),
      obscureText: true,
    );
  }
}
