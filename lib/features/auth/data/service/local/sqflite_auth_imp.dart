import 'package:smartFin/data/sqflite/sqlite_service.dart';
import 'package:smartFin/features/auth/data/models/user_model.dart';
import 'package:smartFin/features/auth/data/service/local/sqflite_auth.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteAuthImp implements SqfliteAuth {
  final SqliteService sqliteService;

  SqfliteAuthImp(this.sqliteService);

  late final Future<Database> db = sqliteService.database;

  @override
  Future<UserModel> getUser() async {
    final List<Map<String, dynamic>> result =
        await db.then((db) => db.query('users', limit: 1));
    if (result.isNotEmpty) {
      return UserModel.fromJson(result.first);
    }
    return UserModel.empty();
  }

  @override
  Future<void> removeUser() async {
    await db.then((db) => db.delete('users'));
  }

  @override
  Future<UserModel> saveUser(UserModel userModel) async {
    await db.then((db) => db.insert(
          'users',
          userModel.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        ));
    return userModel;
  }
  @override
  Future<UserModel> addUser(UserModel userModel) async {
    await db.then((db) => db.insert(
          'users',
          userModel.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        ));
    return userModel;
  }
}
