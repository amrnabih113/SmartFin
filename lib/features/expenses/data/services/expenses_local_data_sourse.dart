import 'package:smartFin/data/sqflite/sqlite_service.dart';
import 'package:smartFin/features/expenses/data/models/expense_model.dart';

abstract class ExpensesLocalDataSource {
  Future<List<ExpenseModel>> getExpenses({
    required String userId,
    int? year,
    int? month,
    DateTime? date,
    String? categoryId,
    String? accountId,
    String? budgetId,
    DateTime? startDate,
    DateTime? endDate,
  });
}

class ExpensesLocalDataSourceImp implements ExpensesLocalDataSource {
  final SqliteService _sqliteService;

  ExpensesLocalDataSourceImp(this._sqliteService);

  @override
  Future<List<ExpenseModel>> getExpenses({
    required String userId,
    int? year,
    int? month,
    DateTime? date,
    String? categoryId,
    String? accountId,
    String? budgetId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final db = await _sqliteService.database;

    final whereClauses = <String>[];
    final whereArgs = <dynamic>[];

    // Ensure userId is provided
    if (userId.isNotEmpty) {
      whereClauses.add('user_id = ?');
      whereArgs.add(userId);
    }

    // Filter only expenses
    whereClauses.add("transaction_type = 'expense'");

    if (year != null) {
      whereClauses.add("strftime('%Y', date) = ?");
      whereArgs.add(year.toString());
    }

    if (month != null) {
      whereClauses.add("strftime('%m', date) = ?");
      whereArgs.add(month.toString().padLeft(2, '0'));
    }

    if (date != null) {
      whereClauses.add('date(date) = date(?)');
      whereArgs.add(date.toIso8601String());
    }

    if (categoryId != null && categoryId.isNotEmpty) {
      whereClauses.add('category_id = ?');
      whereArgs.add(categoryId);
    }

    if (accountId != null && accountId.isNotEmpty) {
      whereClauses.add('account_id = ?');
      whereArgs.add(accountId);
    }

    if (budgetId != null && budgetId.isNotEmpty) {
      whereClauses.add('budget_id = ?');
      whereArgs.add(budgetId);
    }

    if (startDate != null && endDate != null) {
      whereClauses.add('date BETWEEN ? AND ?');
      whereArgs.add(startDate.toIso8601String());
      whereArgs.add(endDate.toIso8601String());
    }

    final where = whereClauses.isNotEmpty ? whereClauses.join(' AND ') : null;

    final result = await db.query(
      'transactions',
      where: where,
      whereArgs: whereArgs,
    );

    return result.map((e) => ExpenseModel.fromJson(e)).toList();
  }
}
