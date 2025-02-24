import 'package:fpdart/fpdart.dart';
import 'package:smartFin/core/error/failures.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';

class SyncTransactionsWithRemote {
  final TransactionsRepository _repository;

  SyncTransactionsWithRemote(this._repository);

  Future<Either<Failure, void>> call() async {
    return await _repository.syncTransactionsWithRemote();
  }
}
