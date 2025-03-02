import 'package:flutter/services.dart';
import 'package:smartFin/core/constants/texts.dart';
import 'package:smartFin/core/local_storage/my_local_storage.dart';
import 'package:smartFin/features/transactions/data/models/transactions_model.dart';
import 'package:smartFin/features/transactions/data/services/local/transactions_local_datasourse.dart';
import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';
import 'package:sqflite/sqflite.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final TransactionsLocalDatasourse localDatasourse;
  final MyLocalStorage localStorage;

  TransactionsRepositoryImpl(
    this.localDatasourse,
    this.localStorage,
  );

  @override
  Future<void> addTransaction(TransactionEntity transaction) async {
    try {
      final responce = await localDatasourse
          .addTransaction(TransactionsModel.fromEntity(transaction));
      print(
          "responce: $responce =========================================================");
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteTransaction(String transactionId) async {
    try {
      await localDatasourse.deleteTransaction(transactionId);
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<TransactionEntity>> getRecentTransactions() async {
    final userId = localStorage.readData<String>(MyTexts.userId);
    if (userId == null) {
      throw Exception('User not found');
    }
    try {
      final List<TransactionEntity> transactions =
          await localDatasourse.getTransactions(
        userId: userId,
        limit: 5,
        orderBy: 'date DESC',
      );
      return transactions;
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<TransactionEntity?> getTransactionById(String transactionId) async {
    final userId = localStorage.readData<String>(MyTexts.userId);
    if (userId == null) {
      throw Exception('User not found');
    }
    try {
      return await localDatasourse.getTransactionById(transactionId);
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<TransactionEntity>> getTransactionsByAccount(
      String accountId) async {
    final userId = localStorage.readData<String>(MyTexts.userId);
    if (userId == null) {
      throw Exception('User not found');
    }

    try {
      final transactions = await localDatasourse.getTransactions(
        userId: userId,
        accountId: accountId,
      );
      return transactions;
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<TransactionEntity>> getTransactionsByBudget(
      String budgetId) async {
    final userId = localStorage.readData<String>(MyTexts.userId);
    if (userId == null) {
      throw Exception('User not found');
    }
    try {
      return await localDatasourse.getTransactions(
        userId: userId,
        budgetId: budgetId,
      );
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<TransactionEntity>> getTransactionsByCategory(
      String categoryId) async {
    final userId = localStorage.readData<String>(MyTexts.userId);
    if (userId == null) {
      throw Exception('User not found');
    }
    try {
      return await localDatasourse.getTransactions(
        userId: userId,
        categoryId: categoryId,
      );
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<TransactionEntity>> getTransactionsByDate(DateTime date) async {
    final userId = localStorage.readData<String>(MyTexts.userId);
    if (userId == null) {
      throw Exception('User not found');
    }
    try {
      return await localDatasourse.getTransactions(
        userId: userId,
        startDate: date,
        endDate: date.add(const Duration(days: 1)),
      );
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<TransactionEntity>> getTransactionsByDateRange(
      DateTime startDate, DateTime endDate) async {
    final userId = localStorage.readData<String>(MyTexts.userId);
    if (userId == null) {
      throw Exception('User not found');
    }
    try {
      return await localDatasourse.getTransactions(
        userId: userId,
        startDate: startDate,
        endDate: endDate,
      );
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<TransactionEntity>> getTransactionsByType(
      String transactionType) async {
    final userId = localStorage.readData<String>(MyTexts.userId);
    if (userId == null) {
      throw Exception('User not found');
    }
    try {
      return await localDatasourse.getTransactions(
        userId: userId,
        transactionType: transactionType,
      );
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<TransactionEntity>> getTransactoinsByMonth(
      String month, String year) async {
    final userId = localStorage.readData<String>(MyTexts.userId);
    if (userId == null) {
      throw Exception('User not found');
    }
    try {
      final transactions = await localDatasourse.getTransactions(
        userId: userId,
        startDate: DateTime(int.parse(year), int.parse(month)),
        endDate: DateTime(int.parse(year), int.parse(month) + 1),
      );
      return transactions;
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateTransaction(TransactionEntity transaction) async {
    final userId = localStorage.readData<String>(MyTexts.userId);
    if (userId == null) {
      throw Exception('User not found');
    }
    try {
      await localDatasourse
          .updateTransaction(TransactionsModel.fromEntity(transaction));
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
