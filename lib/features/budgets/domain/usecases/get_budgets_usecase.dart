import 'package:smartFin/features/budgets/domain/entites/budget_Entity.dart';
import 'package:smartFin/features/budgets/domain/repository/budget_repository.dart';

class GetBudgetsUsecase {
  final BudgetRepository _budgetRepository;

  GetBudgetsUsecase(this._budgetRepository);

  Future<List<BudgetEntity>> execute() async {
    return await _budgetRepository.getBudgets();
  }
}
