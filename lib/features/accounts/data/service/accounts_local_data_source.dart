import 'package:smartFin/data/sqflite/sqlite_service.dart';
import 'package:smartFin/features/accounts/data/models/account_model.dart';

abstract class AccountsLocalDataSource {
  Future<void> addAccount(AccountModel account);

  Future<void> updateAccount(AccountModel account);

  Future<void> deleteAccount(String accountId);

  Future<List<AccountModel>> fetchAccounts(
      {required String userId, String? accountId, bool? isMain});
}

class AccountsLocalDataSourceImp implements AccountsLocalDataSource {
  final SqliteService sqliteService;

  AccountsLocalDataSourceImp(this.sqliteService);

  @override
  Future<void> addAccount(AccountModel account) async {
    final db = await sqliteService.database;
    await db.insert('accounts', account.toMap());
  }

  @override
  Future<void> deleteAccount(String id) async {
    final db = await sqliteService.database;
    await db.delete('accounts', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<AccountModel>> fetchAccounts(
      {required String userId, String? accountId, bool? isMain}) async {
    final db = await sqliteService.database;

    // Define query conditions dynamically
    final conditions = ['user_id = ?'];
    final whereArgs = [userId];

    if (accountId != null) {
      conditions.add('id = ?');
      whereArgs.add(accountId);
    }

    if (isMain != null) {
      conditions.add('is_main = ?');
      whereArgs.add((isMain ? '1' : '0'));
    }

    // Construct WHERE clause
    final whereClause = conditions.join(' AND ');

    // Execute query
    final List<Map<String, dynamic>> maps =
        await db.query('accounts', where: whereClause, whereArgs: whereArgs);

    return maps.map((map) => AccountModel.fromMap(map)).toList();
  }

  @override
  Future<void> updateAccount(AccountModel account) async {
    final db = await sqliteService.database;
    await db.update('accounts', account.toMap(),
        where: 'id = ?', whereArgs: [account.id]);
  }
}
