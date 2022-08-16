import 'package:meta/meta.dart';
import 'package:treinamento_flutter/data/cache/cache.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usescases/helpers/helpers.dart';
import '../../../domain/usescases/usecases.dart';



class LocalLoadCurrentAccount implements LoadCurrentAccount{
  final FetchSecureCacheStorage fetchSecureCacheStorage;
  
  LocalLoadCurrentAccount({@required this.fetchSecureCacheStorage});
  
  Future<AccountEntity> load() async {
    try{
      final token = await fetchSecureCacheStorage.fetchSecure('token');
      return AccountEntity(token);
      
    } catch(error) {
      throw DomainError.unexpected;
    }
  }
}