import '../../../domain/usescases/usecases.dart';

import '../../../data/usecases/usecases.dart';

import '../factories.dart';


SaveCurrentAccount makeLocalSaveCurrentAccount() {
  return LocalSaveCurrentAccount(
    saveSecureCacheStorage: makeLocalStorageAdapter()
  );
}