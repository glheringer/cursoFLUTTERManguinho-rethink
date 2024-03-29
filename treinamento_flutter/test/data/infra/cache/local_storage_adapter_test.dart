import 'dart:math';

import 'package:faker/faker.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:treinamento_flutter/infra/cache/cache.dart';



class FlutterSecureStorageSpy extends Mock implements FlutterSecureStorage {}

LocalStorageAdapter sut;
FlutterSecureStorageSpy secureStorage;
String key = faker.lorem.word();
String value = faker.guid.guid();

void main() {
  setUp(() {
    secureStorage = FlutterSecureStorageSpy();
    sut = LocalStorageAdapter(secureStorage: secureStorage);
  });

  void mockSaveSecureError() {
    when(secureStorage.write(key: anyNamed('key'), value: anyNamed('value')))
        .thenThrow(Exception());
  }
  group('Save Secure', (){
    test('Should call save secure with correct values', () async {
    await sut.saveSecure(key: key, value: value);

    verify(secureStorage.write(key: key, value: value));
  });

    test('Should throw if SaveSecure throws', () async {
      //Nesse teste ele nao quer tratar o erro (pegar um erro especifico) usando o try catch, mas ele quer que a funcao do SUT lance o erro para frente, por isso no expect usamos uma Exception qualquer.

      mockSaveSecureError();

      final future = sut.saveSecure(key: key, value: value);

      expect(future, throwsA(isA<Exception>())); //isA substitui o TypeMatcher que ficou depreciado
    });
  });
  
  group('Fetch Secure', (){
    PostExpectation mockLoadSecureCall() =>
       when(secureStorage.read(key: anyNamed('key')));
    
    void mockLoadSecure() {
      mockLoadSecureCall().thenAnswer((_) async => value);
    }
    void mockLoadSecureError() {
      mockLoadSecureCall().thenThrow(Exception());
   }
    setUp((){
      mockLoadSecure();
    });

    test('Should call  FetchSecure with correct value', () async {
      await sut.fetchSecure(key);

      verify(secureStorage.read(key: key));
    });

    test('Should return correct value on sucess', () async{
      final fetchedValue = await sut.fetchSecure(key);

      expect(fetchedValue, value);
    });

    test('Should throw if SaveSecure throws', () async {
      mockLoadSecureError();

       final future = sut.fetchSecure(key);

      expect(future, throwsA(isA<Exception>()));
    });
  });

}
