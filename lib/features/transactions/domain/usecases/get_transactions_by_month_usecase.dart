import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';

class GetTransactionsByMonthUsecase {
  final TransactionsRepository repository;

  GetTransactionsByMonthUsecase(this.repository);

  Future<List<TransactionEntity>> execute(String month, String year) async {
    return await repository.getTransactoinsByMonth(month, year);
  }
}
