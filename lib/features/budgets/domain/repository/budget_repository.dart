import 'package:smartFin/features/budgets/domain/entites/budget_entity.dart';

abstract class BudgetRepository {
  Future<void> setMainBudget(BudgetEntity budget);

  Future<void> addBudget(BudgetEntity budget);

  Future<void> updateBudget(BudgetEntity budget);

  Future<void> deleteBudget(String budgetId);

  Future<List<BudgetEntity>> getActiveBudgets();

  Future<List<BudgetEntity>> getBudgets();

  Future<BudgetEntity> getBudgetById(String id);

  Future<BudgetEntity> getMainBudget();
}
