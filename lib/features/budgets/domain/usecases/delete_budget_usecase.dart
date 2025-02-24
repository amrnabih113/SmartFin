import 'package:smartFin/features/budgets/domain/repository/budget_repository.dart';

class DeleteBudgetUsecase {
  final BudgetRepository _budgetRepository;

  DeleteBudgetUsecase(this._budgetRepository);

  Future<void> execute(String budgetId) async {
    await _budgetRepository.deleteBudget(budgetId);
  }
}