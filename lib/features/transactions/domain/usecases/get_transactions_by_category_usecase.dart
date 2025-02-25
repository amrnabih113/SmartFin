import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';

class GetTransactionsByCategoryUsecase {
  final TransactionsRepository _transactionRepository;

  GetTransactionsByCategoryUsecase(this._transactionRepository);
  
  Future<List<TransactionEntity>> execute(String category) async {
    return await _transactionRepository.getTransactionsByCategory(category);
  }
}
