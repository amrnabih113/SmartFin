import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smartFin/features/auth/data/repository/auth_repository.dart';
import 'package:smartFin/features/auth/data/service/supabase_auth.dart';
import 'package:smartFin/features/auth/data/service/supabase_auth_impl.dart';
import 'package:smartFin/features/auth/domain/repository/auth_repository.dart';
import 'package:smartFin/features/auth/domain/usecases/user_reset_password.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_in_with_email_and_password.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_in_with_google.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_out.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_up.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

class Di {
  static Future<void> init() async {
    sl.registerLazySingleton(() => Di());
    sl.registerLazySingleton<GetStorage>(() => GetStorage());
    sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
    sl.registerLazySingleton<SupabaseAuth>(() => SupabaseAuthImpl(sl()));

    // Register Repository
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

    // Register Use Cases
    sl.registerLazySingleton<UserSignInWithEmailAndPassword>(
        () => UserSignInWithEmailAndPassword(sl()));
    sl.registerLazySingleton<UserSignInWithGoogle>(
        () => UserSignInWithGoogle(sl()));
    sl.registerLazySingleton<UserSignOut>(() => UserSignOut(sl()));
    sl.registerLazySingleton<UserSignUp>(() => UserSignUp(sl()));
    sl.registerLazySingleton<UserResetPassword>(() => UserResetPassword(sl()));
  }
}
