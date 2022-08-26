import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treinamento_flutter/ui/helpers/i18n/i18n.dart';

import '../../../../ui/helpers/errors/ui_error.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: R.strings.email,
          icon: Icon(
            Icons.email,
            color: Theme.of(context).primaryColorLight,
          )),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
