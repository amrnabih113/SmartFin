import 'package:smartFin/features/auth/data/models/user_model.dart';
import 'package:smartFin/features/auth/data/service/local/sqflite_auth.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteAuthImp implements SqfliteAuth {
  final Database db;

  SqfliteAuthImp(this.db);

  @override
  Future<UserModel> getUser() async {
    final List<Map<String, dynamic>> result = await db.query('users', limit: 1);
    if (result.isNotEmpty) {
      return UserModel.fromJson(result.first);
    }
    return UserModel.empty();
  }

  @override
  Future<void> removeUser() async {
    await db.delete('users');
  }

  @override
  Future<UserModel> saveUser(UserModel userModel) async {
    await db.insert(
      'users',
      userModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return userModel;
  }
}
