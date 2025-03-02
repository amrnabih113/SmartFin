import 'package:smartFin/features/accounts/domain/entites/account_entity.dart';
import 'package:smartFin/features/accounts/domain/repository/accounts_repository.dart';

class AddAccountUsecase {
  final AccountsRepository repository;
  AddAccountUsecase(this.repository);


  Future<void> execute(AccountEntity account) async {
    return await repository.addAccount(account);
  }
}