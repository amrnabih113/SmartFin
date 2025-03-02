import 'package:smartFin/features/expenses/domain/entites/expense_entity.dart';

class ExpenseModel extends ExpenseEntity {
  const ExpenseModel(
      {required super.id,
      required super.categoryId,
      required super.amount,
      required super.note,
      required super.date,
      super.accountId,
      super.budgetId});

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
      id: json['id'] ?? '',
      categoryId: json['category_id'] ?? '',
      amount: json['amount'] ?? 0.0,
      note: json['note'] ?? '',
      date: json['date'] ?? '',
      accountId: json['account_id'] ?? '',
      budgetId: json['budget_id'] ?? '');

  Map<String, dynamic> toJson() => {
        'id': id,
        'category_id': categoryId,
        'amount': amount,
        'note': note,
        'date': date,
        'account_id': accountId,
        'budget_id': budgetId,
      };

  ExpenseModel copyWith({
    String? id,
    String? categoryId,
    double? amount,
    String? note,
    String? date,
    String? accountId,
    String? budgetId,
  }) {
    return ExpenseModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      date: date ?? this.date,
      accountId: accountId ?? this.accountId,
      budgetId: budgetId ?? this.budgetId,
    );
  }

  factory ExpenseModel.fromEntity(ExpenseEntity entity) {
    return ExpenseModel(
      id: entity.id,
      categoryId: entity.categoryId,
      amount: entity.amount,
      note: entity.note,
      date: entity.date,
      accountId: entity.accountId,
      budgetId: entity.budgetId,
    );
  }

  ExpenseEntity toEntity() {
    return ExpenseEntity(
      id: id,
      categoryId: categoryId,
      amount: amount,
      note: note,
      date: date,
      accountId: accountId,
      budgetId: budgetId,
    );
  }
}
