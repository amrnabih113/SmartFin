import 'package:smartFin/features/expenses/domain/entites/expense_entity.dart';
import 'package:smartFin/features/expenses/domain/repository/expenses_repository.dart';

class GetExpensesByCategoryUsecase {
  final ExpensesRepository _repository;

  GetExpensesByCategoryUsecase(this._repository);

  Future<List<ExpenseEntity>> execute(String categoryId) async {
    return await _repository.getExpensesByCategory(categoryId);
  }
}
