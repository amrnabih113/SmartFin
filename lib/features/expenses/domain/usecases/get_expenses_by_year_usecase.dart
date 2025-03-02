import 'package:smartFin/features/expenses/domain/entites/expense_entity.dart';
import 'package:smartFin/features/expenses/domain/repository/expenses_repository.dart';

class GetExpensesByYearUsecase {
  final ExpensesRepository _repository;

  GetExpensesByYearUsecase(this._repository);

  Future<List<ExpenseEntity>> execute(String year) async {
    return await _repository.getExpensesByYear(year);
  }
}
