import 'package:flutter_test/flutter_test.dart';
import 'package:treinamento_flutter/presentation/protocols/protocols.dart';

import 'package:treinamento_flutter/validation/validators/validators.dart';

void main(){
  EmailValidation sut;
    
    setUp((){
      sut = EmailValidation('any_field');
    });

    test('Should return null if email is empty', (){
      expect(sut.validate(''), null);
    });

    test('Should return null if email is null', (){
      expect(sut.validate(null), null);
    });

    test('Should return null if email is valid', (){
      expect(sut.validate('guilherme.heringer@rethink.dev'), null);
    });

    test('Should return null if email is invalid', (){
      expect(sut.validate('guilherme.heringer'), ValidationError.invalidField);
    });
  }
  
  