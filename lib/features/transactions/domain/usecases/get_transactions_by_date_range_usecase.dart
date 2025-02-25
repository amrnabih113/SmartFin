import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';

class GetTransactionsByDateRangeUsecase {
  final TransactionsRepository repository;

  GetTransactionsByDateRangeUsecase(this.repository);

  Future<List<TransactionEntity>> execute(DateTime startDate, DateTime endDate)async{
    return await repository.getTransactionsByDateRange(startDate, endDate);
  }
}