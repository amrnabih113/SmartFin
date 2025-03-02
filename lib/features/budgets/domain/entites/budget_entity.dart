import 'package:equatable/equatable.dart';

class BudgetEntity extends Equatable {
  final String id;
  final String userId;
  final String name;
  final double amount;
  final double usedAmount;
  final String catgoryId;
  final String status;
  final int isMain;
  final DateTime startDate;
  final DateTime endDate;

  const BudgetEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.amount,
    required this.usedAmount,
    required this.catgoryId,
    required this.status,
    required this.isMain,
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        amount,
        usedAmount,
        startDate,
        endDate,
        catgoryId,
        status,
        isMain
      ];

  static BudgetEntity empty() => BudgetEntity(
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
}
