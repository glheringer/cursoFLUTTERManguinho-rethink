import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:treinamento_flutter/domain/entities/account_entity.dart';
import 'package:treinamento_flutter/domain/helpers/helpers.dart';

import 'package:treinamento_flutter/data/cache/cache.dart';
import 'package:treinamento_flutter/data/usecases/usecases.dart';

class FetchSecureCacheStorageSpy extends Mock implements FetchSecureCacheStorage{}
void main(){
  FetchSecureCacheStorageSpy fetchSecureCacheStorage;
  LocalLoadCurrentAccount sut;
  String token;

  PostExpectation mockFetchSecureCall() => when(fetchSecureCacheStorage.fetchSecure(any));

  void mockFetchSecure(){
    mockFetchSecureCall().thenAnswer((_) async => token);
  }

  void mockFetchSecurError(){
    mockFetchSecureCall().thenThrow(Exception());

  }
  
  setUp((){
     fetchSecureCacheStorage = FetchSecureCacheStorageSpy();
     sut = LocalLoadCurrentAccount(fetchSecureCacheStorage: fetchSecureCacheStorage);
     token = faker.guid.guid();
     mockFetchSecure();
  });
  

  test('Should call FetchCacheStorage with correct values', () async {

    await sut.load();

    verify(fetchSecureCacheStorage.fetchSecure('token'));
  });

  test('Should call FetchCacheStorage with correct values', () async {

    final account = await sut.load();

    expect(account, AccountEntity(token));
  });

  test('Should throw UnexpectedError if FetchSecureCacheStorage throws', () async {
    mockFetchSecurError();

    final account = sut.load();

    expect(account, throwsA(DomainError.unexpected));
  });
}