import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:treinamento_flutter/ui/pages/signup/signup_presenter.dart';

import 'package:treinamento_flutter/ui/helpers/helpers.dart';
import '../../../../ui/helpers/errors/ui_error.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);
    return StreamBuilder<UIError>(
        stream: presenter.emailErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
                labelText: R.strings.email,
                icon: Icon(
                  Icons.email,
                  color: Theme.of(context).primaryColorLight,
                )),
            keyboardType: TextInputType.emailAddress,
            onChanged: presenter.validateEmail,
          );
        });
  }
}
