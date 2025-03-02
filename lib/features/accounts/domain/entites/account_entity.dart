// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String id;
  final String userId;
  final String name;
  final int isMain;
  final double balance;
  final String currency;
  final String password;
  final int isFamilyBudget;

  const AccountEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.isMain,
    required this.balance,
    required this.currency,
    required this.password,
    required this.isFamilyBudget,
  });
  @override
  List<Object> get props {
    return [
      id,
      userId,
      name,
      balance,
      currency,
      password,
      isFamilyBudget,
      isMain
    ];
  }

  AccountEntity copyWith({
    String? id,
    String? userId,
    String? name,
    double? balance,
    String? currency,
    int? isMain,
    String? password,
    int? isFamilyBudget,
  }) {
    return AccountEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
      password: password ?? this.password,
      isFamilyBudget: isFamilyBudget ?? this.isFamilyBudget, isMain: isMain ?? this.isMain,
    );
  }

  static AccountEntity empty() => const AccountEntity(
      id: '', userId: '', name: '', balance: 0.0, currency: '', password: '', isFamilyBudget: 0, isMain: 0);

}
