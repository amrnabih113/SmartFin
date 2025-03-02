import 'package:smartFin/features/accounts/domain/entites/account_entity.dart';
import 'package:smartFin/features/accounts/domain/repository/accounts_repository.dart';

class GetTheMainAccountUsecase {
  GetTheMainAccountUsecase(this.repository);
  final AccountsRepository repository;

  Future<AccountEntity?> execute() async => await repository.getTheMainAccount();
  
}