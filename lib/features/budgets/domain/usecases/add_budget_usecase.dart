import 'package:smartFin/features/budgets/domain/entites/budget_entity.dart';
import 'package:smartFin/features/budgets/domain/repository/budget_repository.dart';

class AddBudgetUsecase {
  final BudgetRepository _budgetRepository;

  AddBudgetUsecase(this._budgetRepository);

  Future<void> execute(BudgetEntity budget) async {
    await _budgetRepository.addBudget(budget);
  }
}