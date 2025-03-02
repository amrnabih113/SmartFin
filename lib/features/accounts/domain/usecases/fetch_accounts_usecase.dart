import 'package:smartFin/features/accounts/domain/entites/account_entity.dart';
import 'package:smartFin/features/accounts/domain/repository/accounts_repository.dart';

class FetchAccountsUsecase {
  final AccountsRepository repository;

  FetchAccountsUsecase(this.repository);


  Future<List<AccountEntity>> execute() async {
    return await repository.fetchAccounts();
  }
}