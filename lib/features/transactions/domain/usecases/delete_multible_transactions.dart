import 'package:fpdart/fpdart.dart';
import 'package:smartFin/core/error/failures.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';

class DeleteMultipleTransactions {
  final TransactionsRepository repository;

  DeleteMultipleTransactions(this.repository);

  Future<Either<Failure, int>> call(List<String> transactionIds) async {
    return await repository.deleteMultipleTransactions(transactionIds);
  }
}
