import 'package:smartFin/features/budgets/domain/entites/budget_Entity.dart';
import 'package:smartFin/features/budgets/domain/repository/budget_repository.dart';

class GetActiveBudgetsUsecase {
  final BudgetRepository _budgetRepository;

  GetActiveBudgetsUsecase(this._budgetRepository);

  Future<List<BudgetEntity>> execute() async{
    return await _budgetRepository.getActiveBudgets();
  }
}