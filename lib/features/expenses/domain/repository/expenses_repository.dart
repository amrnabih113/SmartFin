import 'package:smartFin/features/expenses/domain/entites/expense_entity.dart';

abstract class ExpensesRepository {
  Future<List<ExpenseEntity>> getExpensesByYear(String year);

  Future<List<ExpenseEntity>> getExpensesByMonth(String month, String year);

  Future<List<ExpenseEntity>> getExpensesByDate(DateTime date);

  Future<List<ExpenseEntity>> getExpensesByCategory(String categoryId);

  Future<List<ExpenseEntity>> getExpensesByAccount(String accountId);

  Future<List<ExpenseEntity>> getExpensesByBudget(String budgetId);

  Future<List<ExpenseEntity>> getExpensesByDateRange(
      DateTime startDate, DateTime endDate);
}
