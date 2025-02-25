import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';

class GetTransactionsByDateUsecase {
  final TransactionsRepository _transactionRepository;

  GetTransactionsByDateUsecase(this._transactionRepository);

  Future<List<TransactionEntity>> execute(DateTime date) async {
    return _transactionRepository.getTransactionsByDate(date);
  }
}
