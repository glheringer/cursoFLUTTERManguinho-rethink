import 'package:treinamento_flutter/domain/entities/account_entity.dart';

class RemoteAccountModel{
  final String acessToken;

  RemoteAccountModel(this.acessToken);

  factory RemoteAccountModel.fromJson(Map json) => RemoteAccountModel(json['acessToken']);

  AccountEntity toEntity() => AccountEntity(acessToken);
}