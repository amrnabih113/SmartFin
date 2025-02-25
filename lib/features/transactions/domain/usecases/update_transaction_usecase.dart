import 'package:smartFin/features/transactions/data/models/transactions_model.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';
import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';

class UpdateTransactionUsecase {
  final TransactionsRepository repository;

  UpdateTransactionUsecase(this.repository);

  Future<void> call(TransactionEntity transaction) async {
    final TransactionsModel transactionModel = TransactionsModel.fromEntity(transaction);
    return await repository.updateTransaction(transactionModel);
  }
}
