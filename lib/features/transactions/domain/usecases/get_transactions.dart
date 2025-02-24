import 'package:fpdart/fpdart.dart';
import 'package:smartFin/core/error/failures.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';
import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';

class GetTransactions {
  final TransactionsRepository repository;

  GetTransactions(this.repository);

  Future<Either<Failure, List<TransactionEntity>>> call({
    DateTime? startDate,
    DateTime? endDate,
    String? categoryId,
    String? accountId,
    String? transactionType,
  }) async {
    return await repository.getTransactions(
      startDate: startDate,
      endDate: endDate,
      categoryId: categoryId,
      accountId: accountId,
      transactionType: transactionType,
    );
  }
}
