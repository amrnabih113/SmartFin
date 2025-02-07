
import 'package:fpdart/fpdart.dart';
import 'package:smartFin/core/error/failures.dart';

abstract class UseCase<Type, Params> {

  Future<Either<Failure, Type>> call(Params params);
  
}
