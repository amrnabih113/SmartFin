import 'package:smartFin/data/sqflite/sqlite_service.dart';
import 'package:smartFin/features/transactions/data/models/transactions_model.dart';
import 'package:smartFin/features/transactions/data/services/local/sqlite_transactions_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SqliteTransactionsServiceImpl implements SqliteTransactionsService {
  final SqliteService sqliteService;
  final SupabaseClient supabase;

  SqliteTransactionsServiceImpl(this.sqliteService, this.supabase);

  @override
  Future<List<TransactionsModel>> getTransactions(
      {DateTime? startDate,
      DateTime? endDate,
      String? categoryId,
      String? accountId,
      String? transactionType}) async {
    try {
      final db = await sqliteService.database;
      final whereClauses = <String>[];
      final whereArgs = <dynamic>[];

      if (startDate != null) {
        whereClauses.add("date >= ?");
        whereArgs.add(startDate.toIso8601String());
      }
      if (endDate != null) {
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

      final whereClause =
          whereClauses.isEmpty ? null : whereClauses.join(" AND ");
      final result = await db.query("transactions",
          where: whereClause, whereArgs: whereArgs);

      return result.map((e) => TransactionsModel.fromMap(e)).toList();
    } on Exception catch (e) {
      throw Exception("Failed to get transactions from SQLite: $e");
    }
  }

  @override
  Future<int> addTransaction(TransactionsModel transaction) async {
    try {
      final db = await sqliteService.database;
      final responce = await db.insert("transactions", transaction.toMap());
      return responce;
    } on Exception catch (e) {
      throw Exception("Failed to add transaction to SQLite: $e");
    }
  }

  @override
  Future<void> batchInsertTransactions(
      List<TransactionsModel> transactions) async {
    try {
      final db = await sqliteService.database;
      final batch = db.batch();

      for (var transaction in transactions) {
        batch.insert("transactions", transaction.toMap());
      }

      await batch.commit(noResult: true);
    } on Exception catch (e) {
      throw Exception("Failed to batch insert transactions to SQLite: $e");
    }
  }

  @override
  Future<int> deleteMultipleTransactions(List<String> transactionIds) async {
    try {
      final db = await sqliteService.database;
      final batch = db.batch();

      for (var id in transactionIds) {
        batch.delete("transactions", where: "id = ?", whereArgs: [id]);
      }

      await batch.commit(noResult: true);
      return transactionIds.length;
    } on Exception catch (e) {
      throw Exception(
          "Failed to delete multiple transactions from SQLite: $e");
    }
  }

  @override
  Future<int> deleteTransaction(String transactionId) async {
    try {
      final db = await sqliteService.database;
      return await db
          .delete("transactions", where: "id = ?", whereArgs: [transactionId]);
    } on Exception catch (e) {
      throw Exception("Failed to delete transaction from SQLite: $e");
    }
  }

  @override
  Future<int> updateTransaction(TransactionsModel transaction) async {
    try {
      final db = await sqliteService.database;
      return await db.update("transactions", transaction.toMap(),
          where: "id = ?", whereArgs: [transaction.id]);
    } on Exception catch (e) {
      throw Exception("Failed to update transaction in SQLite: $e");
    }
  }

  @override
  Future<TransactionsModel?> getTransactionById(String transactionId) async {
    try {
      final db = await sqliteService.database;
      final result = await db
          .query("transactions", where: "id = ?", whereArgs: [transactionId]);

      if (result.isNotEmpty) {
        return TransactionsModel.fromMap(result.first);
      }
      return null;
    } on Exception catch (e) {
      throw Exception("Failed to get transaction by id from SQLite: $e");
    }
  }

  Future<List<TransactionsModel>> getUnSyncedTransactions() async {
    try {
      final db = await sqliteService.database;
      final result = await db.query("transactions",
          where: "sync_status = ?", whereArgs: ['pending']);

      return result.map((e) => TransactionsModel.fromMap(e)).toList();
    } on Exception catch (e) {
      throw Exception("Failed to get unsynced transactions from SQLite: $e");
    }
  }

  @override
  Future<void> syncTransactionsWithRemote() async {
    try {
      final db = await sqliteService.database;

      /// 1️⃣ Fetch Unsynced Local Transactions (status = 'pending')
      final unsyncedTransactions = await db.query(
        "transactions",
        where: "sync_status = ?",
        whereArgs: ["pending"],
      );

      if (unsyncedTransactions.isNotEmpty) {
        /// Push to Supabase
        await supabase.from("transactions").insert(unsyncedTransactions);

        /// Mark as Synced in SQLite
        for (var transaction in unsyncedTransactions) {
          await db.update(
            "transactions",
            {"sync_status": "synced"},
            where: "id = ?",
            whereArgs: [transaction["id"]],
          );
        }
      }

      /// 2️⃣ Fetch New Remote Transactions (not present in SQLite)
      final remoteTransactions = await supabase.from("transactions").select();

      for (var transaction in remoteTransactions) {
        final existing = await db.query(
          "transactions",
          where: "id = ?",
          whereArgs: [transaction["id"]],
        );

        if (existing.isEmpty) {
          await db
              .insert("transactions", {...transaction, "sync_status": "synced"});
        }
      }

      /// 3️⃣ Delete Transactions Marked as Deleted Locally
      final deletedTransactions = await db.query(
        "transactions",
        where: "sync_status = ?",
        whereArgs: ["deleted"],
      );

      for (var transaction in deletedTransactions) {
        await supabase.from("transactions").delete().eq("id", transaction["id"]!);
        await db.delete("transactions",
            where: "id = ?", whereArgs: [transaction["id"]]);
      }
    } on Exception catch (e) {
      throw Exception("Failed to sync transactions with remote: $e");
    }
  }
}

