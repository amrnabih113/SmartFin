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
import 'package:smartFin/features/transactions/data/services/local/transactions_local_datasourse.dart';
import 'package:smartFin/features/transactions/domain/repository/transactions_repository.dart';
import 'package:smartFin/features/transactions/data/services/remote/supabase_transactions_service.dart';
import 'package:smartFin/features/transactions/data/services/remote/supabase_transactions_service_impl.dart';
import 'package:smartFin/features/transactions/data/repository/transactions_repository_impl.dart';
import 'package:smartFin/features/transactions/domain/usecases/add_transaction_usecase.dart';
import 'package:smartFin/features/transactions/domain/usecases/delete_transaction_usecase.dart';
import 'package:smartFin/features/transactions/domain/usecases/get_recent_transactions_usecase.dart';
import 'package:smartFin/features/transactions/domain/usecases/get_transactions_by_account_usecase.dart';
import 'package:smartFin/features/transactions/domain/usecases/get_transactions_by_budget_usecase.dart';
import 'package:smartFin/features/transactions/domain/usecases/get_transactions_by_category_usecase.dart';
import 'package:smartFin/features/transactions/domain/usecases/get_transactions_by_date_range_usecase.dart';
import 'package:smartFin/features/transactions/domain/usecases/get_transactions_by_date_usecase.dart';
import 'package:smartFin/features/transactions/domain/usecases/get_transactions_by_month_usecase.dart';
import 'package:smartFin/features/transactions/domain/usecases/get_transactions_by_type_usecase.dart';
import 'package:smartFin/features/transactions/domain/usecases/get_transactions_with_id_usecase.dart';
import 'package:smartFin/features/transactions/domain/usecases/update_transaction_usecase.dart';
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
    sl.registerLazySingleton<TransactionsLocalDatasourse>(
        () => TransactionsLocalDatasourseImpl(sl()));
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
    sl.registerLazySingleton<TransactionsRepository>(
        () => TransactionsRepositoryImpl(sl(), sl()));
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

    // Transactions UseCases
    sl.registerLazySingleton<AddTransactionUsecase>(
        () => AddTransactionUsecase(sl()));
    sl.registerLazySingleton<DeleteTransactionUsecase>(
        () => DeleteTransactionUsecase(sl()));
    sl.registerLazySingleton<UpdateTransactionUsecase>(
        () => UpdateTransactionUsecase(sl()));
    sl.registerLazySingleton<GetRecentTransactionsUsecase>(
        () => GetRecentTransactionsUsecase(sl()));
    sl.registerLazySingleton<GetTransactionsByAccountUsecase>(
        () => GetTransactionsByAccountUsecase(sl()));
    sl.registerLazySingleton<GetTransactionsByBudgetUsecase>(
        () => GetTransactionsByBudgetUsecase(sl()));
    sl.registerLazySingleton<GetTransactionsByCategoryUsecase>(
        () => GetTransactionsByCategoryUsecase(sl()));
    sl.registerLazySingleton<GetTransactionsByDateUsecase>(
        () => GetTransactionsByDateUsecase(sl()));
    sl.registerLazySingleton<GetTransactionsByDateRangeUsecase>(
        () => GetTransactionsByDateRangeUsecase(sl()));
    sl.registerLazySingleton<GetTransactionsByMonthUsecase>(
        () => GetTransactionsByMonthUsecase(sl()));
    sl.registerLazySingleton<GetTransactionsByTypeUsecase>(
        () => GetTransactionsByTypeUsecase(sl()));
    sl.registerLazySingleton<GetTransactionsWithIdUsecase>(
        () => GetTransactionsWithIdUsecase(sl()));

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
