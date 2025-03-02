import 'package:equatable/equatable.dart';

class ExpenseEntity extends Equatable {
  final String id;
  final String categoryId;
  final double amount;
  final String note;
  final String date;
  final String? accountId;
  final String? budgetId;

  const ExpenseEntity(
      {required this.id,
      required this.categoryId,
      required this.amount,
      required this.note,
      required this.date,
      this.accountId,
      this.budgetId});

  @override
  List<Object?> get props =>
      [id, categoryId, amount, note, date, accountId, budgetId];
}
