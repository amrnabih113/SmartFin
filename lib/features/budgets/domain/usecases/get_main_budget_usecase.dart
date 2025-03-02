import 'package:smartFin/features/budgets/domain/entites/budget_entity.dart';
import 'package:smartFin/features/budgets/domain/repository/budget_repository.dart';

class GetMainBudgetUsecase {
  final BudgetRepository _budgetRepository;

  GetMainBudgetUsecase(this._budgetRepository);

  Future<BudgetEntity> execute() async {
    return await _budgetRepository.getMainBudget();
  }
}
