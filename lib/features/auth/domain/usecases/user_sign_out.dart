
import 'package:smartFin/features/auth/domain/repository/auth_repository.dart';
import 'package:smartFin/features/auth/domain/usecases/usecase.dart';

class UserSignOut  implements UseCase<void, void> {
  final AuthRepository authRepository;

  UserSignOut(this.authRepository);

  @override
  Future<void>call(params) async {
    return await authRepository.signOut();
  }
}
