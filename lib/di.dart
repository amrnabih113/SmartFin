import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smartFin/core/local_storage/my_local_storage.dart';
import 'package:smartFin/data/sqflite/sqlite_service.dart';
import 'package:smartFin/data/sqflite/sqlite_service_imp.dart';
import 'package:smartFin/features/auth/data/repository/auth_repository.dart';
import 'package:smartFin/features/auth/data/service/local/sqflite_auth.dart';
import 'package:smartFin/features/auth/data/service/local/sqflite_auth_imp.dart';
import 'package:smartFin/features/auth/data/service/remote/firebase/firebase_auth_impl.dart';
import 'package:smartFin/features/auth/data/service/remote/auth.dart';
import 'package:smartFin/features/auth/data/service/remote/supabase/supabase_auth.dart';
import 'package:smartFin/features/auth/domain/repository/auth_repository.dart';
import 'package:smartFin/features/auth/domain/usecases/user_reset_password.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_in_with_email_and_password.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_in_with_google.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_out.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_up.dart';
import 'package:smartFin/features/auth/presentation/controller/signin_controller.dart';
import 'package:smartFin/features/budgets/data/repository/budget_repository_impl.dart';
import 'package:smartFin/features/budgets/data/services/budget_local_data_sourse.dart';
import 'package:smartFin/features/budgets/domain/repository/budget_repository.dart';
import 'package:smartFin/features/budgets/domain/usecases/add_budget_usecase.dart';
import 'package:smartFin/features/budgets/domain/usecases/delete_budget_usecase.dart';
import 'package:smartFin/features/budgets/domain/usecases/get_active_budgets_usecase.dart';
import 'package:smartFin/features/budgets/domain/usecases/get_budget_by_id_usecase.dart';
import 'package:smartFin/features/budgets/domain/usecases/get_budgets_usecase.dart';
import 'package:smartFin/features/budgets/domain/usecases/get_main_budget_usecase.dart';
import 'package:smartFin/features/budgets/domain/usecases/set_main_budget_usecase.dart';
import 'package:smartFin/features/budgets/domain/usecases/update_budget_usecase.dart';
import 'package:smartFin/features/categories/domain/repository/category_repository.dart';
import 'package:smartFin/features/categories/data/services/local/sqflite_categories_service.dart';
import 'package:smartFin/features/categories/data/services/local/sqflite_categories_service_impl.dart';
import 'package:smartFin/features/categories/data/repository/category_repository_impl.dart';
import 'package:smartFin/features/categories/domain/usecases/categories_usecases.dart';
import 'package:smartFin/features/onboarding/data/repository/onboarding_repository.dart';
import 'package:smartFin/features/onboarding/domain/repository/onboarding_repositoy.dart';
import 'package:smartFin/features/onboarding/domain/usecases/onboarding_usecases.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';
import 'package:smartFin/features/transactions/data/services/local/sqlite_transactions_service.dart';
import 'package:smartFin/features/transactions/data/services/local/sqlite_transactions_service_impl.dart';
import 'package:smartFin/features/transactions/data/services/remote/supabase_transactions_service.dart';
import 'package:smartFin/features/transactions/data/services/remote/supabase_transactions_service_impl.dart';
import 'package:smartFin/features/transactions/data/repository/transactions_repository_impl.dart';
import 'package:smartFin/features/transactions/domain/usecases/add_transaction.dart';
import 'package:smartFin/features/transactions/domain/usecases/delete_multible_transactions.dart';
import 'package:smartFin/features/transactions/domain/usecases/delete_transaction.dart';
import 'package:smartFin/features/transactions/domain/usecases/get_transactions.dart';
import 'package:smartFin/features/transactions/domain/usecases/sync_with_remote.dart';
import 'package:smartFin/features/transactions/domain/usecases/update_transaction.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

class Di {
  static Future<void> init() async {
    sl.registerLazySingleton(() => Di());
    sl.registerLazySingleton<GetStorage>(() => GetStorage());
    sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
    sl.registerLazySingleton<SqliteService>(() => SqliteServiceImp());
    sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    sl.registerLazySingleton<MyLocalStorage>(() => MyLocalStorage.instance());

    // Register Service

    // Auth
    sl.registerLazySingleton<Auth>(() => FirebaseAuthImpl(sl(), sl()));
    sl.registerLazySingleton<SqfliteAuth>(() => SqfliteAuthImp(sl()));
    sl.registerLazySingleton<SupabaseAuth>(() => SupabaseAuth(sl()));
    // Transactions
    sl.registerLazySingleton<SqliteTransactionsService>(
        () => SqliteTransactionsServiceImpl(sl(), sl()));
    sl.registerLazySingleton<SupabaseTransactionsService>(
        () => SupabaseTransactionsServiceImpl(sl()));
    // Categories
    sl.registerLazySingleton<SqfliteCategoriesService>(
        () => SqfliteCategoriesServiceImpl(sl(), sl()));
    // Budgets
    sl.registerLazySingleton<BudgetLocalDataSourse>(
        () => BudgetLocalDataSourseImp(sl()));


    // Register Repository

    // Auth
    sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(sl(), sl(), sl(), sl()));
    // Onboarding
    sl.registerLazySingleton<OnboardingRepositoy>(
        () => OnboardingRepositoyimpl(storage: sl()));
    // Transactions
    sl.registerLazySingleton<TransactionsRepository>(() =>
        TransactionsRepositoryImpl(localService: sl(), remoteService: sl()));
    // Categories
    sl.registerLazySingleton<CategoryRepository>(
        () => CategoryRepositoryImpl(sqfliteCategoriesService: sl()));
    // Budgets
    sl.registerLazySingleton<BudgetRepository>(
        () => BudgetRepositoryImpl(sl(), sl()));

    // Register Use Cases

    // onboarding
    sl.registerLazySingleton<GetOnboardingDataUseCase>(
        () => GetOnboardingDataUseCase(sl()));
    sl.registerLazySingleton<GetOnboardingStatusUseCase>(
        () => GetOnboardingStatusUseCase(sl()));
    sl.registerLazySingleton<SetOnboardingStatusUseCase>(
        () => SetOnboardingStatusUseCase(sl()));
    sl.registerLazySingleton<ResetOnboardingStatusUseCase>(
        () => ResetOnboardingStatusUseCase(sl()));

    // auth
    sl.registerLazySingleton<UserSignInWithEmailAndPassword>(
        () => UserSignInWithEmailAndPassword(sl()));
    sl.registerLazySingleton<UserSignInWithGoogle>(
        () => UserSignInWithGoogle(sl()));
    sl.registerLazySingleton<UserSignOut>(() => UserSignOut(sl()));
    sl.registerLazySingleton<UserSignUp>(() => UserSignUp(sl()));
    sl.registerLazySingleton<UserResetPassword>(() => UserResetPassword(sl()));

    // transactions
    sl.registerLazySingleton<GetTransactions>(() => GetTransactions(sl()));
    sl.registerLazySingleton<AddTransaction>(() => AddTransaction(sl()));
    sl.registerLazySingleton<DeleteMultipleTransactions>(
        () => DeleteMultipleTransactions(sl()));
    sl.registerLazySingleton<DeleteTransaction>(() => DeleteTransaction(sl()));
    sl.registerLazySingleton<UpdateTransaction>(() => UpdateTransaction(sl()));
    sl.registerLazySingleton<SyncTransactionsWithRemote>(
        () => SyncTransactionsWithRemote(sl()));

    // categories
    sl.registerLazySingleton<GetCategoriesUseCase>(
        () => GetCategoriesUseCase(sl()));
    sl.registerLazySingleton<GetTopFiveCategoriesUseCase>(
        () => GetTopFiveCategoriesUseCase(sl()));
    sl.registerLazySingleton<CreateCategoryUseCase>(
        () => CreateCategoryUseCase(sl()));
    sl.registerLazySingleton<DeleteCategoryUseCase>(
        () => DeleteCategoryUseCase(sl()));
    sl.registerLazySingleton<UpdateCategoryUseCase>(
        () => UpdateCategoryUseCase(sl()));
    sl.registerLazySingleton<SyncCategoriesWithRemoteUseCase>(
        () => SyncCategoriesWithRemoteUseCase(sl()));

    // budgets
    sl.registerLazySingleton<AddBudgetUsecase>(() => AddBudgetUsecase(sl()));
    sl.registerLazySingleton<DeleteBudgetUsecase>(
        () => DeleteBudgetUsecase(sl()));
    sl.registerLazySingleton<UpdateBudgetUsecase>(
        () => UpdateBudgetUsecase(sl()));
    sl.registerLazySingleton<GetBudgetsUsecase>(() => GetBudgetsUsecase(sl()));
    sl.registerLazySingleton<GetMainBudgetUsecase>(
        () => GetMainBudgetUsecase(sl()));
    sl.registerLazySingleton<SetMainBudgetUsecase>(
        () => SetMainBudgetUsecase(sl()));
    sl.registerLazySingleton<GetActiveBudgetsUsecase>(
        () => GetActiveBudgetsUsecase(sl()));
    sl.registerLazySingleton<GetBudgetByIdUsecase>(
        () => GetBudgetByIdUsecase(sl()));

    Get.lazyPut(() => SignInController(
        userSignInWithEmailAndPassword: sl(),
        userSignInWithGoogle: sl(),
        userSignOut: sl(),
        localStorage: sl()));
  }
}
