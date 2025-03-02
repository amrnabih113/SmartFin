import 'package:smartFin/features/accounts/domain/entites/account_entity.dart';

abstract class AccountsRepository {

  Future<void> addAccount(AccountEntity account);

  Future<List<AccountEntity>> fetchAccounts();

  Future<void> deleteAccount(AccountEntity account);

  Future<void> updateAccount(AccountEntity account);

  Future<AccountEntity?> getAccountById(String id);

  Future<AccountEntity?> getTheMainAccount();

}
