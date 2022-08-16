import 'package:treinamento_flutter/domain/entities/account_entity.dart';

abstract class LoadCurrentAccount {
  Future<AccountEntity> load ();
}