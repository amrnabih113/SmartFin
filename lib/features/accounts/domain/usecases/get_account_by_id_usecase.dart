import 'package:smartFin/features/accounts/domain/entites/account_entity.dart';
import 'package:smartFin/features/accounts/domain/repository/accounts_repository.dart';

class GetAccountByIdUsecase {
  final AccountsRepository repository;

  GetAccountByIdUsecase(this.repository);

  Future<AccountEntity?> execute(String id) async =>
      await repository.getAccountById(id);
}
