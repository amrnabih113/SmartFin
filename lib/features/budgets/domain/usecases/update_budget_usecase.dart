import 'package:smartFin/features/budgets/domain/repository/budget_repository.dart';

class UpdateBudgetUsecase {
  final BudgetRepository _budgetRepository;

  UpdateBudgetUsecase(this._budgetRepository);
  Future<void> execute(String budgetId) async {
    await _budgetRepository.deleteBudget(budgetId);
  }
}