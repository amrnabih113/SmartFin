import 'package:smartFin/features/expenses/domain/entites/expense_entity.dart';
import 'package:smartFin/features/expenses/domain/repository/expenses_repository.dart';

class GetExpensesByDateUsecase {
  final ExpensesRepository _repository;

  GetExpensesByDateUsecase(this._repository);

  Future<List<ExpenseEntity>> call(DateTime date) async {
    return await _repository.getExpensesByDate(date);
  }
}
