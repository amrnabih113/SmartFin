import 'package:smartFin/data/sqflite/sqlite_service.dart';
import 'package:smartFin/features/expenses/data/models/expense_model.dart';

abstract class ExpensesLocalDataSource {
  Future<List<ExpenseModel>> getExpenses({
    required String userId,
    String? year,
    String? month,
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
    String? year,
    String? month,
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

    if (year != null || month != null) {
      if (year != null && month != null) {
        // Get the first and last day of the given month and year
        final startDate = DateTime(int.parse(year), int.parse(month), 1);
        final endDate = DateTime(int.parse(year), int.parse(month) + 1, 0);

        whereClauses.add("date BETWEEN ? AND ?");
        whereArgs.add(startDate.toIso8601String());
        whereArgs.add(endDate.toIso8601String());
      } else if (year != null) {
        // Get the first and last day of the given year
        final startDate = DateTime(int.parse(year), 1, 1);
        final endDate = DateTime(int.parse(year), 12, 31);

        whereClauses.add("date BETWEEN ? AND ?");
        whereArgs.add(startDate.toIso8601String());
        whereArgs.add(endDate.toIso8601String());
      } else if (month != null) {
        // Default to current year if only month is provided
        final now = DateTime.now();
        final startDate = DateTime(now.year, int.parse(month), 1);
        final endDate = DateTime(now.year, int.parse(month) + 1, 0);

        whereClauses.add("date BETWEEN ? AND ?");
        whereArgs.add(startDate.toIso8601String());
        whereArgs.add(endDate.toIso8601String());
      }
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

    whereClauses.add('transaction_type = ?');
    whereArgs.add('expense');

    final where = whereClauses.isNotEmpty ? whereClauses.join(' AND ') : null;
    print("Where: $where whereArgs: $whereArgs");
    final result = await db.query(
      'transactions',
      where: where,
      whereArgs: whereArgs,
    );

    return result.map((e) => ExpenseModel.fromJson(e)).toList();
  }
}
