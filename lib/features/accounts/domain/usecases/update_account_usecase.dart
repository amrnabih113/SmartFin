import 'package:smartFin/features/accounts/domain/entites/account_entity.dart';
import 'package:smartFin/features/accounts/domain/repository/accounts_repository.dart';

class UpdateAccountUsecase {
  final AccountsRepository repository;

  UpdateAccountUsecase(this.repository);

  Future<void> execute(AccountEntity account) async =>
      await repository.updateAccount(account);
}
