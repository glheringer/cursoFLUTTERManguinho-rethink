import 'package:meta/meta.dart';

import '../../../../data/cache/cache.dart';
import '../../../../domain/entities/entities.dart';

import '../../../../domain/usescases/helpers/helpers.dart';

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
