import 'package:smartFin/features/transactions/data/models/transactions_model.dart';

abstract class SqliteTransactionsService {
  Future<List<TransactionsModel>> getTransactions({
    DateTime? startDate,
    DateTime? endDate,
    String? categoryId,
    String? accountId,
    String? transactionType,
  });
  Future<int> addTransaction(TransactionsModel transaction);
  Future<int> updateTransaction(TransactionsModel transaction);
  Future<TransactionsModel?> getTransactionById(String transactionId);
  Future<int> deleteTransaction(String transactionId);
  Future<int> deleteMultipleTransactions(List<String> transactionIds);
  Future<void> syncTransactionsWithRemote();
  Future<void> batchInsertTransactions(List<TransactionsModel> transactions);
}
