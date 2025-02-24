
import 'package:smartFin/features/auth/domain/entites/login_data.dart';import 'package:smartFin/features/auth/domain/repository/auth_repository.dart';
import 'package:smartFin/features/auth/domain/usecases/usecase.dart';

class UserSignInWithEmailAndPassword  implements UseCase<String, LoginData> {

  final AuthRepository authRepository;

  UserSignInWithEmailAndPassword(this.authRepository);

  @override

  Future<String> call(params) async{
      return await authRepository.signInWithEmailAndPassword(params.email ,params.password);
  }

}