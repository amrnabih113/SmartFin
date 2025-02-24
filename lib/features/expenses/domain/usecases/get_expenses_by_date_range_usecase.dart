import 'package:smartFin/features/expenses/domain/entites/expense_entity.dart';
import 'package:smartFin/features/expenses/domain/repository/expenses_repository.dart';

class GetExpensesByDateRangeUsecase {
  final ExpensesRepository _repository;

  GetExpensesByDateRangeUsecase(this._repository);

  Future<List<ExpenseEntity>> execute(
      DateTime startDate, DateTime endDate) async {
    return await _repository.getExpensesByDateRange(startDate, endDate);
  }
}
