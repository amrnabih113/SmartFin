import 'package:smartFin/features/expenses/domain/entites/expense_entity.dart';
import 'package:smartFin/features/expenses/domain/repository/expenses_repository.dart';

class GetExpensesByBudgetUsecase {
  final ExpensesRepository _expenseRepository;

  GetExpensesByBudgetUsecase(this._expenseRepository);

  Future<List<ExpenseEntity>> execute(String budgetId) async {
    return await _expenseRepository.getExpensesByBudget(budgetId);
  }
}