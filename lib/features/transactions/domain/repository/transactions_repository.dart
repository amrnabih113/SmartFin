import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';

abstract class TransactionsRepository {

  Future<List<TransactionEntity>> getRecentTransactions();

  Future<List<TransactionEntity>> getTransactionsByDate(DateTime date);
  
  Future<List<TransactionEntity>> getTransactionsByCategory(String categoryId);

  Future<List<TransactionEntity>> getTransactionsByAccount(String accountId);

  Future<List<TransactionEntity>> getTransactionsByBudget(String budgetId);

  Future<List<TransactionEntity>> getTransactionsByDateRange(DateTime startDate, DateTime endDate);

  Future<List<TransactionEntity>> getTransactionsByType(String transactionType);

  Future<List<TransactionEntity>> getTransactoinsByMonth(String month, String year);

  Future<TransactionEntity?> getTransactionById(String transactionId);

  Future<void> addTransaction(TransactionEntity transaction);

  Future<void> updateTransaction(TransactionEntity transaction);

  Future<void> deleteTransaction(String transactionId);


}

