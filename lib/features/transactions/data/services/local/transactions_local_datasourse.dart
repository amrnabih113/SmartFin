import 'package:smartFin/data/sqflite/sqlite_service.dart';
import 'package:smartFin/features/transactions/data/models/transactions_model.dart';

abstract class TransactionsLocalDatasourse {
  Future<List<TransactionsModel>> getTransactions({
    required String userId,
    String? budgetId,
    DateTime? startDate,
    DateTime? endDate,
    String? categoryId,
    String? accountId,
    String? transactionType,
    int? limit,
    String? orderBy,
  });
  Future<int> addTransaction(TransactionsModel transaction);
  Future<int> updateTransaction(TransactionsModel transaction);
  Future<int> deleteTransaction(String transactionId);
  Future<int> deleteMultipleTransactions(List<String> transactionIds);
  Future<TransactionsModel?> getTransactionById(String transactionId);
  // Future<void> syncTransactionsWithRemote();
}

class TransactionsLocalDatasourseImpl implements TransactionsLocalDatasourse {
  final SqliteService sqliteService;

  TransactionsLocalDatasourseImpl(this.sqliteService);

@override
Future<List<TransactionsModel>> getTransactions({
  required String userId,
  String? budgetId,
  DateTime? startDate,
  DateTime? endDate,
  String? categoryId,
  String? accountId,
  String? transactionType,
  int? limit,
  String? orderBy,
}) async {
  final db = await sqliteService.database;
  final whereClauses = <String>[];
  final whereArgs = <dynamic>[];

  if (userId.isNotEmpty) {
    whereClauses.add("user_id = ?");
    whereArgs.add(userId);
  }

  if (budgetId != null) {
    whereClauses.add("budget_id = ?");
    whereArgs.add(budgetId);
  }

  if (startDate != null && endDate != null) {
    whereClauses.add("date BETWEEN ? AND ?");
    whereArgs.add(startDate.toIso8601String());
    whereArgs.add(endDate.toIso8601String());
  } else if (startDate != null) {
    whereClauses.add("date >= ?");
    whereArgs.add(startDate.toIso8601String());
  } else if (endDate != null) {
    whereClauses.add("date <= ?");
    whereArgs.add(endDate.toIso8601String());
  }

  if (categoryId != null) {
    whereClauses.add("category_id = ?");
    whereArgs.add(categoryId);
  }

  if (accountId != null) {
    whereClauses.add("account_id = ?");
    whereArgs.add(accountId);
  }

  if (transactionType != null) {
    whereClauses.add("transaction_type = ?");
    whereArgs.add(transactionType);
  }

  final whereClause = whereClauses.isNotEmpty ? whereClauses.join(" AND ") : null;

  final result = await db.query(
    "transactions",
    where: whereClause,
    whereArgs: whereArgs,
    orderBy: orderBy ?? "date DESC", // Default order by date descending
    limit: limit, // Apply limit if provided
  );

  return result.map((e) => TransactionsModel.fromMap(e)).toList();
}


  @override
  Future<int> addTransaction(TransactionsModel transaction) async {
    final db = await sqliteService.database;
    final responce = await db.insert("transactions", transaction.toMap());
    return responce;
  }

  @override
  Future<int> deleteMultipleTransactions(List<String> transactionIds) async {
    final db = await sqliteService.database;
    final batch = db.batch();

    for (var id in transactionIds) {
      batch.delete("transactions", where: "id = ?", whereArgs: [id]);
    }

    await batch.commit(noResult: true);
    return transactionIds.length;
  }

  @override
  Future<int> deleteTransaction(String transactionId) async {
    final db = await sqliteService.database;
    return await db
        .delete("transactions", where: "id = ?", whereArgs: [transactionId]);
  }

  @override
  Future<int> updateTransaction(TransactionsModel transaction) async {
    final db = await sqliteService.database;
    return await db.update("transactions", transaction.toMap(),
        where: "id = ?", whereArgs: [transaction.id]);
  }

  @override
  Future<TransactionsModel?> getTransactionById(String transactionId) async {
    final db = await sqliteService.database;
    final result = await db
        .query("transactions", where: "id = ?", whereArgs: [transactionId]);

    if (result.isNotEmpty) {
      return TransactionsModel.fromMap(result.first);
    }
    return null;
  }
}
