import 'package:treinamento_flutter/domain/entities/account_entity.dart';

abstract class SaveCurrentAccount {
  Future<void> save (AccountEntity account);
}