
import 'package:smartFin/features/auth/domain/repository/auth_repository.dart';
import 'package:smartFin/features/auth/domain/usecases/usecase.dart';

class UserSignInWithGoogle implements UseCase<void, void> {
  final AuthRepository authRepository;

  UserSignInWithGoogle(this.authRepository);

  @override
  Future<void> call(void params) async {
    return await authRepository.googleSignIn(); 
  }
}
