import 'package:flutter/services.dart';
import 'package:smartFin/core/constants/texts.dart';
import 'package:smartFin/core/local_storage/my_local_storage.dart';
import 'package:smartFin/features/accounts/data/models/account_model.dart';
import 'package:smartFin/features/accounts/data/service/accounts_local_data_source.dart';
import 'package:smartFin/features/accounts/domain/entites/account_entity.dart';
import 'package:smartFin/features/accounts/domain/repository/accounts_repository.dart';
import 'package:sqflite/sqflite.dart';

class AccountsRepositoryImpl implements AccountsRepository {
  final AccountsLocalDataSource accountLocalDataSource;
  final MyLocalStorage myLocalStorage = MyLocalStorage.instance();

  AccountsRepositoryImpl( this.accountLocalDataSource);
  @override
  Future<void> addAccount(AccountEntity account) async {
    try {
      await accountLocalDataSource.addAccount(AccountModel.fromEntity(account));
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteAccount(AccountEntity account) async {
    try {
      await accountLocalDataSource.deleteAccount(account.id);
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<AccountEntity>> fetchAccounts() async {
    final user = myLocalStorage.readData<String>(MyTexts.userId);
    if (user == null) {
      throw Exception('User not found');
    }
    try {
      return await accountLocalDataSource.fetchAccounts(userId: user);
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AccountEntity?> getAccountById(String id) async {
    final user = myLocalStorage.readData<String>(MyTexts.userId);
    if (user == null) {
      throw Exception('User not found');
    }
    try {
      return await accountLocalDataSource
          .fetchAccounts(userId: user, accountId: id)
          .then((e) => e.firstOrNull);
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateAccount(AccountEntity account) async {
    try {
      await accountLocalDataSource
          .updateAccount(AccountModel.fromEntity(account));
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AccountEntity?> getTheMainAccount() async {
    final user = myLocalStorage.readData<String>(MyTexts.userId);
    if (user == null) {
      throw Exception('User not found');
    }
    try {
      final account = await accountLocalDataSource.fetchAccounts(
          userId: user, isMain: true);
      if (account.isEmpty) {
        return null;
      }
      return account.first;
    } on DatabaseException catch (e) {
      throw Exception(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
