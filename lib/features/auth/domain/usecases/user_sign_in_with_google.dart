import 'package:fpdart/fpdart.dart';
import 'package:smartFin/core/error/failures.dart';
import 'package:smartFin/features/auth/data/repository/auth_repository.dart';
import 'package:smartFin/features/auth/domain/usecases/usecase.dart';

class UserSignInWithGoogle implements UseCase<void, void> {
  final AuthRepository authRepository;

  UserSignInWithGoogle(this.authRepository);

  @override
  Future<Either<Failure, void>> call(void params) async {
    return await authRepository.googleSignIn(); 
  }
}
