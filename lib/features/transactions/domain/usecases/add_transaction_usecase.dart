import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';
import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';

class AddTransactionUsecase {
  final TransactionsRepository repository;

  AddTransactionUsecase(this.repository);

  Future<void> execute(TransactionEntity transaction) async {
    return await repository.addTransaction(transaction);
  }
}
