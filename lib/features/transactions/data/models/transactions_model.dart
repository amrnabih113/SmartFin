import 'dart:convert';

import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';

enum SyncStatus { local, synced, syncing }

class TransactionsModel extends TransactionEntity {
  TransactionsModel({
    required super.id,
    required super.userId,
    required super.categoryId,
    required super.accountId,
    required super.budgetId,
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
      'type': transactionType,
      'note': note,
      'date': date.toIso8601String(),
      'sync_status': syncStatus,
    };
  }

  factory TransactionsModel.fromMap(Map<String, dynamic> map) {
    return TransactionsModel(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      categoryId: map['category_id'] as String,
      accountId: map['account_id'] as String,
      budgetId: map['budget_id'] as String,
      amount: (map['amount'] as num).toDouble(),
      transactionType: map['transaction_type'] as String,
      note: map['note'] as String,
      date: DateTime.parse(map['date'] as String),
      syncStatus: map['sync_status'] as String,
    );
  }

  /// Convert model to JSON string
  String toJson() => json.encode(toMap());

  /// Create a model from JSON string
  factory TransactionsModel.fromJson(String source) =>
      TransactionsModel.fromMap(json.decode(source));

  /// Convert `TransactionEntity` to `TransactionsModel`
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

  /// Convert model to `TransactionEntity`
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
