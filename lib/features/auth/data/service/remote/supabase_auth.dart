import 'package:smartFin/features/auth/data/models/user_model.dart';

abstract class SupabaseAuth {

  Future<UserModel> signupWithEmailAndPassword(String fName, String lName,
      String userName, String email, String password);

  Future<UserModel> signInWithEmailAndPassword(String email, String password);

  Future<void> resetPassword(String email);

  Future<void> signInWithGoogle();

  Future<void> signOut();
}
