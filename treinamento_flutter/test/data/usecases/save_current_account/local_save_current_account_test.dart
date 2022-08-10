import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';


import 'package:treinamento_flutter/domain/entities/entities.dart';
import 'package:treinamento_flutter/domain/usescases/helpers/helpers.dart';

class LocalSaveCurrentAccount{
  final SaveSecureCacheStorage saveSecureCacheStorage;
  
  LocalSaveCurrentAccount({@required this.saveSecureCacheStorage});
  
  Future<void> save (AccountEntity account) async {
    try{
      await saveSecureCacheStorage.saveSecure(key: 'token', value: account.token);
    } catch(error) {
      throw DomainError.unexpected;
    }
  }
}

abstract class SaveSecureCacheStorage{
  Future<void> saveSecure ({@required String key , @required String value});
}
class SaveSecureCacheStorageSpy extends Mock implements SaveSecureCacheStorage{}

void main(){
  test('Should call SaveCacheStorage with correct values', () async {
    final saveSecureCacheStorage = SaveSecureCacheStorageSpy();
    final sut = LocalSaveCurrentAccount(saveSecureCacheStorage: saveSecureCacheStorage);
    final account = AccountEntity(faker.guid.guid());

    await sut.save(account);

    verify(saveSecureCacheStorage.saveSecure(key: 'token' , value: account.token));
  });

  test('Should call SaveCacheStorage with correct values', () async {
    final saveSecureCacheStorage = SaveSecureCacheStorageSpy();
    final sut = LocalSaveCurrentAccount(saveSecureCacheStorage: saveSecureCacheStorage);
    final account = AccountEntity(faker.guid.guid());

   //mudar o retorno do SaveSecureCacheStorageSpy para retornar uma excessao dessa vez
    when(saveSecureCacheStorage.saveSecure(key: anyNamed('key'), value: anyNamed('value'))).thenThrow(Exception());

    final future = sut.save(account);

    expect(future, throwsA(DomainError.unexpected));
  });

}