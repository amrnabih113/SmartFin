import 'package:smartFin/features/transactions/data/models/transactions_model.dart';

abstract class SupabaseTransactionsService {
  Future<List<TransactionsModel>> getTransactions({ DateTime? startDate,
    DateTime? endDate,
    String? categoryId,
    String? accountId,
    String? transactionType,});
  Future<int> addTransaction(TransactionsModel transaction);
  Future<int> updateTransaction(TransactionsModel transaction);
  Future<int> deleteTransaction(String transactionId);
  Future<void> batchInsertTransactions(List<TransactionsModel> transactions);
  Future<int> deleteMultipleTransactions(List<String> transactionIds);
}
