import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';

class GetRecentTransactionsUsecase {
  final TransactionsRepository _repository;

  GetRecentTransactionsUsecase(this._repository);

  Future<List<TransactionEntity>> execute() async =>
      await _repository.getRecentTransactions();
}
