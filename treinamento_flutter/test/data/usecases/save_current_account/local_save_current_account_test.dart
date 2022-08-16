import 'package:flutter_test/flutter_test.dart';

import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';

import 'package:treinamento_flutter/domain/entities/entities.dart';
import 'package:treinamento_flutter/domain/usescases/helpers/helpers.dart';

import 'package:treinamento_flutter/data/cache/cache.dart';
import 'package:treinamento_flutter/data/usecases/usecases.dart';



class SaveSecureCacheStorageSpy extends Mock implements SaveSecureCacheStorage{}

void main(){
  SaveSecureCacheStorageSpy saveSecureCacheStorage;
  LocalSaveCurrentAccount sut;
  AccountEntity account;

  setUp((){
     saveSecureCacheStorage = SaveSecureCacheStorageSpy();
     sut = LocalSaveCurrentAccount(saveSecureCacheStorage: saveSecureCacheStorage);
     account = AccountEntity(faker.guid.guid());
  });
  
  void mockSaveSecureError(){
    //mudar o retorno do SaveSecureCacheStorageSpy para retornar uma excessao dessa vez
    when(saveSecureCacheStorage.saveSecure(key: anyNamed('key'), value: anyNamed('value'))).thenThrow(Exception());

  }

  test('Should call SaveCacheStorage with correct values', () async {

    await sut.save(account);

    verify(saveSecureCacheStorage.saveSecure(key: 'token' , value: account.token));
  });

  test('Should throw UnexpectedError if SaveSecureCacheStorage throws', () async {
    mockSaveSecureError();

    final future = sut.save(account);

    expect(future, throwsA(DomainError.unexpected));
  });

}