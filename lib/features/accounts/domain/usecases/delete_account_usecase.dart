import 'package:smartFin/features/accounts/domain/entites/account_entity.dart';
import 'package:smartFin/features/accounts/domain/repository/accounts_repository.dart';

class DeleteAccountUsecase {
  final AccountsRepository repository;

  DeleteAccountUsecase(this.repository);

  Future<void> execute(AccountEntity account) async =>
      await repository.deleteAccount(account);
}
