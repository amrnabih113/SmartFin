import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';

class GetTransactionsByAccountUsecase {
  final TransactionsRepository repository;

  GetTransactionsByAccountUsecase(this.repository);

  Future<List<TransactionEntity>> execute(String accountId) async {
    return await repository.getTransactionsByAccount(accountId);
  }
}
