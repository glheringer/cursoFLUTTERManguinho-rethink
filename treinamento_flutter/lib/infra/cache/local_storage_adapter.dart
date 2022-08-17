import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/cache/cache.dart';

class LocalStorageAdapter implements SaveSecureCacheStorage {
  final FlutterSecureStorage secureStorage;

  LocalStorageAdapter({@required this.secureStorage});

  Future<void> saveSecure({String key, String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String> fetchSecure({String key}) async {
    return await secureStorage.read(key: key);
  }
}