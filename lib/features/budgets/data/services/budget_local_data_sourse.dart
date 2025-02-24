import 'package:smartFin/data/sqflite/sqlite_service.dart';
import 'package:smartFin/features/budgets/data/models/budget_model.dart';

abstract class BudgetLocalDataSourse {
  BudgetLocalDataSourse(BudgetLocalDataSourseImp Function() param0);

  Future<void> addBudget(BudgetModel budget);
  Future<void> updateBudget(
    BudgetModel budget,
  );
  Future<void> deleteBudget(String budgetId);
  Future<List<BudgetModel>> getBudgets({
    required String userId,
    String? budgetId,
    String? status,
    String? categoryId,
    int? isMain,
    String? startDate,
    String? endDate,
  });
}

class BudgetLocalDataSourseImp implements BudgetLocalDataSourse {
  final SqliteService _sqliteService;

  BudgetLocalDataSourseImp(this._sqliteService);

  @override
  Future<void> addBudget(BudgetModel budget) async {
    final db = await _sqliteService.database;
    await db.insert('budgets', budget.toJson());
  }

  @override
  Future<void> deleteBudget(String budgetId) async {
    final db = await _sqliteService.database;
    await db.delete('budgets', where: 'id = ?', whereArgs: [budgetId]);
  }

  @override
  Future<List<BudgetModel>> getBudgets({
    required String userId,
    String? budgetId,
    String? status,
    String? categoryId,
    int? isMain,
    String? startDate,
    String? endDate,
  }) async {
    final db = await _sqliteService.database;

    final whereClauses = <String>[];
    final whereArgs = <dynamic>[];

    // Ensure userId is provided
    if (userId.isNotEmpty) {
      whereClauses.add('user_id = ?');
      whereArgs.add(userId);
    }

    if (budgetId != null && budgetId.isNotEmpty) {
      whereClauses.add('id = ?');
      whereArgs.add(budgetId);
    }
    if (categoryId != null && categoryId.isNotEmpty) {
      whereClauses.add('category_id = ?');
      whereArgs.add(categoryId);
    }

    if (isMain != null) {
      whereClauses.add('is_main = ?');
      whereArgs.add(isMain);
    }

    if (startDate != null &&
        endDate != null &&
        startDate.isNotEmpty &&
        endDate.isNotEmpty) {
      whereClauses.add('start_date <= ? AND end_date >= ?');
      whereArgs.add(DateTime.parse(endDate).toIso8601String());
      whereArgs.add(DateTime.parse(startDate).toIso8601String());
    }

    if (status != null && status.isNotEmpty) {
      whereClauses.add('status = ?');
      whereArgs.add(status);
    }

    final where = whereClauses.isNotEmpty ? whereClauses.join(' AND ') : null;

    final result = await db.query(
      'budgets',
      where: where,
      whereArgs: whereArgs.isNotEmpty ? whereArgs : null,
    );

    return result.map((e) => BudgetModel.fromJson(e)).toList();
  }

  @override
  Future<void> updateBudget(BudgetModel budget) async {
    final db = await _sqliteService.database;
    await db.update('budgets', budget.toJson(),
        where: 'id = ?', whereArgs: [budget.id]);
  }
}
