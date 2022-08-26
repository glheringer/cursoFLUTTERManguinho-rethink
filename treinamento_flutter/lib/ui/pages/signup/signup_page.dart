import 'package:flutter/material.dart';
import 'package:treinamento_flutter/ui/helpers/helpers.dart';

import '../../components/components.dart';
import 'components/components.dart';

class SignUpPage extends StatelessWidget {
  Widget build(BuildContext context) {
    void _hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return Scaffold(
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: _hideKeyboard,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LoginHead(),
                  Headline1(
                    text: R.strings.addAccount,
                  ),
                  Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Form(
                      child: Column(children: [
                        NameInput(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: EmailInput(),
                        ),
                        PasswordInput(),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 32),
                          child: PasswordConfirmationInput(),
                        ), 
                        SignUpButton(),
                        FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.exit_to_app),
                          label: Text(R.strings.login),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}