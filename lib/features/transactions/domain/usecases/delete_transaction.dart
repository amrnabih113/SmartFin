import 'package:fpdart/fpdart.dart';
import 'package:smartFin/core/error/failures.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';

class DeleteTransaction {
  final TransactionsRepository repository;

  DeleteTransaction(this.repository);

  Future<Either<Failure, int>> call(String transactionId) async {
    return await repository.deleteTransaction(transactionId);
  }
}
