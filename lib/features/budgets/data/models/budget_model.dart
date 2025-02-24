import 'package:smartFin/features/budgets/domain/entites/budget_Entity.dart';

class BudgetModel extends BudgetEntity {
  const BudgetModel(
      {required super.id,
      required super.userId,
      required super.name,
      required super.amount,
      required super.usedAmount,
      required super.catgoryId,
      required super.status,
      required super.isMain,
      required super.startDate,
      required super.endDate});

  factory BudgetModel.fromJson(Map<String, dynamic> json) {
    return BudgetModel(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      amount: json['amount'],
      usedAmount: json['used_amount'],
      catgoryId: json['category_id'],
      status: json['status'],
      isMain: json['is_main'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'amount': amount,
      'used_amount': usedAmount,
      'category_id': catgoryId,
      'status': status,
      'is_main': isMain,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
    };
  }

  static BudgetModel empty() => BudgetModel(
        id: '',
        userId: '',
        name: '',
        amount: 0.0,
        usedAmount: 0.0,
        catgoryId: '',
        status: '',
        isMain: 0,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
      );

  BudgetEntity toEntity() {
    return BudgetEntity(
      id: id,
      userId: userId,
      name: name,
      amount: amount,
      usedAmount: usedAmount,
      catgoryId: catgoryId,
      status: status,
      isMain: isMain,
      startDate: startDate,
      endDate: endDate,
    );
  }

  static BudgetModel fromEntity(BudgetEntity entity) {
    return BudgetModel(
      id: entity.id,
      userId: entity.userId,
      name: entity.name,
      amount: entity.amount,
      usedAmount: entity.usedAmount,
      catgoryId: entity.catgoryId,
      status: entity.status,
      isMain: entity.isMain,
      startDate: entity.startDate,
      endDate: entity.endDate,
    );
  }
}
