import 'package:smartFin/features/budgets/domain/entites/budget_entity.dart';
import 'package:smartFin/features/budgets/domain/repository/budget_repository.dart';

class SetMainBudgetUsecase {
  final BudgetRepository _budgetRepository;

  SetMainBudgetUsecase(this._budgetRepository);

  Future<void> execute(BudgetEntity budget) async {
    await _budgetRepository.setMainBudget(budget);
  }

}