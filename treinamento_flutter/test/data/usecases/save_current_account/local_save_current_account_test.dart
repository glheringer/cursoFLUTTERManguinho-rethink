import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';


import 'package:treinamento_flutter/domain/entities/entities.dart';

class LocalSaveCurrentAccount{
  final SaveSecureCacheStorage saveSecureCacheStorage;
  
  LocalSaveCurrentAccount({@required this.saveSecureCacheStorage});
  
  Future<void> save (AccountEntity account) async {
    await saveSecureCacheStorage.save(key: 'token', value: account.token);
  }
}

abstract class SaveSecureCacheStorage{
  Future<void> save ({@required String key , @required String value});
}
class SaveSecureCacheStorageSpy extends Mock implements SaveSecureCacheStorage{}

void main(){
  test('Should call SaveCacheStorage with correct values', () async {
    final saveSecureCacheStorage = SaveSecureCacheStorageSpy();
    final sut = LocalSaveCurrentAccount(saveSecureCacheStorage: saveSecureCacheStorage);
    final account = AccountEntity(faker.guid.guid());


    await sut.save(account);

    verify(saveSecureCacheStorage.save(key: 'token' , value: account.token));
  });
}