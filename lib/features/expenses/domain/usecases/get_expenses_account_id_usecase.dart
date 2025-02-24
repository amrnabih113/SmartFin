import 'package:smartFin/features/expenses/domain/entites/expense_entity.dart';
import 'package:smartFin/features/expenses/domain/repository/expenses_repository.dart';

class GetExpensesAccountIdUsecase {
  final ExpensesRepository repository;

  GetExpensesAccountIdUsecase(this.repository);

  Future<List<ExpenseEntity>> execute(String accountId) async {
    return await repository.getExpensesByAccount(accountId);
  }
}