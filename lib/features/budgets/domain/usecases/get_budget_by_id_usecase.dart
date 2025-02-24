import 'package:smartFin/features/budgets/domain/entites/budget_Entity.dart';
import 'package:smartFin/features/budgets/domain/repository/budget_repository.dart';

class GetBudgetByIdUsecase {
  final BudgetRepository _budgetRepository;

  GetBudgetByIdUsecase(this._budgetRepository);

  Future<BudgetEntity> execute(String id) async {
    return await _budgetRepository.getBudgetById(id);
  }
}
