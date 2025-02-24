import 'package:smartFin/features/expenses/domain/entites/expense_entity.dart';
import 'package:smartFin/features/expenses/domain/repository/expenses_repository.dart';

class GetExpensesByMonthUsecase {
  final ExpensesRepository _repository;

  GetExpensesByMonthUsecase(this._repository);

  Future<List<ExpenseEntity>> execute(int month, int year) async {
    return await _repository.getExpensesByMonth(month, year);
  }
}
