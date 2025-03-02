import 'dart:convert';
import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';

class TransactionsModel extends TransactionEntity {
  const TransactionsModel({
    required super.id,
    required super.userId,
    required super.categoryId,
     super.accountId,
     super.budgetId,
    required super.amount,
    required super.transactionType,
    required super.note,
    required super.date,
    required super.syncStatus,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'category_id': categoryId,
      'account_id': accountId,
      'budget_id': budgetId,
      'amount': amount,
      'transaction_type': transactionType,
      'note': note,
      'date': date.toIso8601String(),
      'sync_status': syncStatus,
    };
  }

  factory TransactionsModel.fromMap(Map<String, dynamic> map) {
    return TransactionsModel(
      id: map['id'] ?? '',
      userId: map['user_id'] ?? '',
      categoryId: map['category_id'] ?? '',
      accountId: map['account_id'] ?? '',
      budgetId: map['budget_id'] ?? '',
      amount: (map['amount'] as num).toDouble(),
      transactionType: map['transaction_type'] ?? '',
      note: map['note'] ?? '',
      date: DateTime.parse(map['date'] ?? ''),
      syncStatus: map['sync_status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionsModel.fromJson(String source) =>
      TransactionsModel.fromMap(json.decode(source));

  factory TransactionsModel.fromEntity(TransactionEntity entity) {
    return TransactionsModel(
      id: entity.id,
      userId: entity.userId,
      categoryId: entity.categoryId,
      accountId: entity.accountId,
      budgetId: entity.budgetId,
      amount: entity.amount,
      transactionType: entity.transactionType,
      note: entity.note,
      date: entity.date,
      syncStatus: entity.syncStatus,
    );
  }

  TransactionEntity toEntity() {
    return TransactionEntity(
      id: id,
      userId: userId,
      categoryId: categoryId,
      accountId: accountId,
      budgetId: budgetId,
      amount: amount,
      transactionType: transactionType,
      note: note,
      date: date,
      syncStatus: syncStatus,
    );
  }
}
