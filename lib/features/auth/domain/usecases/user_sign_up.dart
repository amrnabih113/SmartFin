
import 'package:smartFin/features/auth/domain/entites/signup_data.dart';
import 'package:smartFin/features/auth/domain/repository/auth_repository.dart';
import 'package:smartFin/features/auth/domain/usecases/usecase.dart';

class UserSignUp implements UseCase<String, SignupData> {

  final AuthRepository authRepository;

  UserSignUp(this.authRepository);
  
  @override
  Future<String> call(params) async{
    return await authRepository.signupWithEmailAndPassword(params.firstName, params.lastName,params.userName ,params.email, params.password);
  }
}
