import 'package:fpdart/fpdart.dart';
import 'package:smartFin/core/error/failures.dart';
import 'package:smartFin/features/transactions/data/models/transactions_model.dart';

abstract class TransactionsRepository {
  /// Fetches all transactions with optional filtering by date range, category, account, and type.
  Future<Either<Failure, List<TransactionsModel>>> getTransactions({
    DateTime? startDate,
    DateTime? endDate,
    String? categoryId,
    String? accountId,
    String? transactionType, // 'income' or 'expense'
  });

  /// Retrieves a single transaction by its ID.
  Future<Either<Failure, TransactionsModel?>> getTransactionById(String transactionId);

  /// Adds a new transaction to the database.
  Future<Either<Failure, int>> addTransaction(TransactionsModel transaction);

  /// Updates an existing transaction.
  Future<Either<Failure, int>> updateTransaction(TransactionsModel transaction);

  /// Deletes a transaction by ID.
  Future<Either<Failure, int>> deleteTransaction(String transactionId);

  /// Deletes multiple transactions by their IDs.
  Future<Either<Failure, int>> deleteMultipleTransactions(List<String> transactionIds);

  /// Syncs local transactions with Supabase (or another remote backend).
  Future<Either<Failure, void>> syncTransactionsWithRemote();

  /// Batches multiple transactions for optimized performance.
  Future<Either<Failure, void>> batchInsertTransactions(List<TransactionsModel> transactions);
}

