import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String id;
  final String userId;
  final String categoryId;
  final String accountId;
  final String budgetId;
  final double amount;
  final String transactionType;
  final String note;
  final String syncStatus;
  final DateTime date;

  const TransactionEntity({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.accountId,
    required this.budgetId,
    required this.amount,
    required this.transactionType,
    required this.note,
    required this.syncStatus,
    required this.date,
  });

  TransactionEntity copyWith({
    String? id,
    String? userId,
    String? categoryId,
    String? accountId,
    String? budgetId,
    double? amount,
    String? transactionType,
    String? note,
    String? syncStatus,
    DateTime? date,
  }) {
    return TransactionEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      accountId: accountId ?? this.accountId,
      budgetId: budgetId ?? this.budgetId,
      amount: amount ?? this.amount,
      transactionType: transactionType ?? this.transactionType,
      note: note ?? this.note,
      date: date ?? this.date,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        categoryId,
        accountId,
        budgetId,
        amount,
        transactionType,
        note,
        date
      ];
}
