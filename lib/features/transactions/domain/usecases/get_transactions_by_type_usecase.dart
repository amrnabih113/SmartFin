import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';

class GetTransactionsByTypeUsecase {
  final TransactionsRepository repository;

  GetTransactionsByTypeUsecase(this.repository);


  Future<List<TransactionEntity>> execute(String transactionType) async {
    return await repository.getTransactionsByType(transactionType);
  }
}