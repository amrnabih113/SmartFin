import 'package:fpdart/fpdart.dart';
import 'package:smartFin/core/error/failures.dart';
import 'package:smartFin/features/auth/data/repository/auth_repository.dart';
import 'package:smartFin/features/auth/domain/usecases/usecase.dart';

class UserResetPassword implements UseCase<void, String> {
  final AuthRepository authRepository;

  UserResetPassword(this.authRepository);

  @override
  Future<Either<Failure, void>> call(String params) async {
    final result = await authRepository.resetPassword(params);
    return result;
  }
}
