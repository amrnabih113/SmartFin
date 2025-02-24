import 'package:fpdart/fpdart.dart';
import 'package:smartFin/core/error/failures.dart';
import 'package:smartFin/features/transactions/data/models/transactions_model.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';
import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';

class AddTransaction {
  final TransactionsRepository repository;

  AddTransaction(this.repository);

  Future<Either<Failure, int>> call(TransactionEntity transaction) async {
    final TransactionsModel transactionModel =
        TransactionsModel.fromEntity(transaction);
    return await repository.addTransaction(transactionModel);
  }
}
