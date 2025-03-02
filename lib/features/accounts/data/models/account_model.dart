import 'dart:convert';

import 'package:smartFin/features/accounts/domain/entites/account_entity.dart';

class AccountModel extends AccountEntity {
  const AccountModel(
      {required super.id,
      required super.userId,
      required super.name,
      required super.balance,
      required super.currency,
      required super.password,
      required super.isFamilyBudget,
      required super.isMain});

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      balance: json['balance'],
      currency: json['currency'],
      password: json['password'],
      isFamilyBudget: json['is_family_budget'],
      isMain: json['is_main']);

  factory AccountModel.fromEntity(AccountEntity entity) => AccountModel(
        id: entity.id,
        userId: entity.userId,
        name: entity.name,
        balance: entity.balance,
        currency: entity.currency,
        password: entity.password,
        isFamilyBudget: entity.isFamilyBudget,
        isMain: entity.isMain,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'name': name,
      'balance': balance,
      'currency': currency,
      'password': password,
      'is_main': isMain,
      'is_family_budget': isFamilyBudget,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      name: map['name'] as String,
      balance: map['balance'] as double,
      currency: map['currency'] as String,
      password: map['password'] as String,
      isFamilyBudget: map['is_family_budget'] as int,
      isMain: map['is_main'] as int,
    );
  }

  String toJson() => json.encode(toMap());

}
