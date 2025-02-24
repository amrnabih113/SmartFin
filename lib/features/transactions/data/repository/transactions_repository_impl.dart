import 'package:fpdart/fpdart.dart';
import 'package:smartFin/core/error/failures.dart';
import 'package:smartFin/features/transactions/data/models/transactions_model.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';
import 'package:smartFin/features/transactions/data/services/local/sqlite_transactions_service.dart';
import 'package:smartFin/features/transactions/data/services/remote/supabase_transactions_service.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final SqliteTransactionsService localService;
  final SupabaseTransactionsService remoteService;

  TransactionsRepositoryImpl({
    required this.localService,
    required this.remoteService,
  });

  /// Fetch transactions with optional filters.
  @override
  Future<Either<Failure, List<TransactionsModel>>> getTransactions({
    DateTime? startDate,
    DateTime? endDate,
    String? categoryId,
    String? accountId,
    String? transactionType,
  }) async {
    try {
      final transactions = await localService.getTransactions(
        startDate: startDate,
        endDate: endDate,
        categoryId: categoryId,
        accountId: accountId,
        transactionType: transactionType,
      );
      return Right(transactions);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  /// Retrieve a single transaction by ID.
  @override
  Future<Either<Failure, TransactionsModel?>> getTransactionById(String transactionId) async {
    try {
      final transaction = await localService.getTransactionById(transactionId);
      return Right(transaction);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  /// Add a new transaction and sync with remote.
  @override
  Future<Either<Failure, int>> addTransaction(TransactionsModel transaction) async {
    try {
      final result = await localService.addTransaction(transaction);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  /// Update a transaction and sync with remote.
  @override
  Future<Either<Failure, int>> updateTransaction(TransactionsModel transaction) async {
    try {
      final result = await localService.updateTransaction(transaction);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  /// Delete a transaction and sync with remote.
  @override
  Future<Either<Failure, int>> deleteTransaction(String transactionId) async {
    try {
      final result = await localService.deleteTransaction(transactionId);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  /// Delete multiple transactions and sync with remote.
  @override
  Future<Either<Failure, int>> deleteMultipleTransactions(List<String> transactionIds) async {
    try {
      final result = await localService.deleteMultipleTransactions(transactionIds);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  /// Sync local transactions with remote storage.
  @override
  Future<Either<Failure, void>> syncTransactionsWithRemote() async {
    try {
      await localService.syncTransactionsWithRemote();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Server error',message: e.toString()));
    }
  }

  /// Batch insert multiple transactions for better performance.
  @override
  Future<Either<Failure, void>> batchInsertTransactions(List<TransactionsModel> transactions) async {
    try {
      await localService.batchInsertTransactions(transactions);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }
}
