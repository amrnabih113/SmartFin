import 'package:smartFin/features/auth/data/models/user_model.dart';

abstract class SqfliteAuth {

  Future<UserModel> saveUser(UserModel userModel);

  Future<UserModel> getUser();

  Future<void> removeUser();
}