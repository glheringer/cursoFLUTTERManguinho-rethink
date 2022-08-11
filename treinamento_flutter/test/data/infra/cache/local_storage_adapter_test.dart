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

  test('Should call save secure with correct values', () async {
    await sut.saveSecure(key: key, value: value);

    verify(secureStorage.write(key: key, value: value));
  });

  test('Should throw if save secure throws', () async {
    //Nesse teste ele nao quer tratar o erro (pegar um erro especifico) usando o try catch, mas ele quer que a funcao do SUT lance o erro para frente, por isso no expect usamos uma Exception qualquer.

    mockSaveSecureError();

    final future = sut.saveSecure(key: key, value: value);

    expect(future, throwsA(isA<Exception>() )); //isA substitui o TypeMatcher que ficou depreciado
  });
}
