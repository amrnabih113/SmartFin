import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';

class DeleteTransactionUsecase {
  final TransactionsRepository repository;

  DeleteTransactionUsecase(this.repository);

  Future<void> execute(String transactionId) async {
    return await repository.deleteTransaction(transactionId);
  }
}
