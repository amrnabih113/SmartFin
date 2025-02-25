import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';

class GetTransactionsByBudgetUsecase {
  final TransactionsRepository repository;
  GetTransactionsByBudgetUsecase(this.repository);


  Future<List<TransactionEntity>> execute(String budgetId)async{
    return await repository.getTransactionsByBudget(budgetId);
  }
}