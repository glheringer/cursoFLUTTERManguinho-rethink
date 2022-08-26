import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_flutter/ui/helpers/helpers.dart';

import '../../../helpers/errors/ui_error.dart';

class PasswordConfirmationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: R.strings.confirmPassword,
        icon: Icon(
          Icons.lock,
          color: Theme.of(context).primaryColorLight,
        ),
      ),
      obscureText: true,
    );
  }
}
