import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';

class GetTransactionsWithIdUsecase {
  final TransactionsRepository repository;

  GetTransactionsWithIdUsecase(this.repository);

  Future<TransactionEntity?> execute(String tranasactionId) async =>
      await repository.getTransactionById(tranasactionId);
}
