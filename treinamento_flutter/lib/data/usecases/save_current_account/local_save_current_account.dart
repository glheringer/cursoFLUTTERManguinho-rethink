import 'package:meta/meta.dart';
import 'package:treinamento_flutter/domain/usescases/usecases.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usescases/usecases.dart';

import '../../../data/cache/cache.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccount{
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
