import 'package:get/get.dart';
import 'package:smartFin/core/constants/texts.dart';
import 'package:smartFin/core/local_storage/my_local_storage.dart';
import 'package:smartFin/core/utils/popups/loaders.dart';
import 'package:smartFin/features/budgets/domain/entites/budget_entity.dart';
import 'package:smartFin/features/budgets/domain/usecases/get_main_budget_usecase.dart';
import 'package:smartFin/features/categories/domain/entities/category_entity.dart';
import 'package:smartFin/features/categories/domain/usecases/get_category_by_id_usecase.dart';
import 'package:smartFin/features/expenses/domain/entites/expense_entity.dart';
import 'package:smartFin/features/expenses/domain/usecases/get_expenses_by_month_usecase.dart';
import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';
import 'package:smartFin/features/transactions/domain/usecases/get_recent_transactions_usecase.dart';
import 'package:smartFin/features/transactions/domain/usecases/get_transactions_by_month_usecase.dart';

class MyHouseholdController extends GetxController {
  static MyHouseholdController get instance => Get.find();

  final GetTransactionsByMonthUsecase getTransactionsByMonthUsecase;
  final GetExpensesByMonthUsecase getExpensesByMonthUsecase;
  final GetRecentTransactionsUsecase getRecentTransactionsUsecase;
  final GetMainBudgetUsecase getMainBudgetUsecase;
  final GetCategoryByIdUsecase getCategoryByIdUsecase;
  final MyLocalStorage  localStorage;

  MyHouseholdController(
      this.getExpensesByMonthUsecase,
      this.getTransactionsByMonthUsecase,
      this.getRecentTransactionsUsecase,
      this.getMainBudgetUsecase,
      this.getCategoryByIdUsecase, this.localStorage);

  final showBalance = false.obs;
  final selectedDate = DateTime.now().obs;
  final totalIncome = 0.0.obs;
  final totalExpenses = 0.0.obs;
  final totalLeft = 0.0.obs;
  final totalExpenses2 = 0.0.obs;
  final noOfTransactions = 0.obs;
  final balance = 0.0.obs;

  final RxList<TransactionEntity> transactions = <TransactionEntity>[].obs;
  final RxList<ExpenseEntity> expenses = <ExpenseEntity>[].obs;
  final Rx<BudgetEntity> mainBudget = BudgetEntity.empty().obs;
  final RxList<CategoryEntity> recentTransactionsCategories =
      <CategoryEntity>[].obs;
  final RxList<TransactionEntity> recentTransactions =
      <TransactionEntity>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    balance.value =  double.parse(localStorage.readData(MyTexts.cashAmount));
    print("cashAmount: ${balance.value}");
    await getTransactions();
    await getMainBudget();
    await getRecentTransactions();
    await getExpenses();
  }

  Future<void> getExpenses() async {
    try {
      final expenses = await getExpensesByMonthUsecase.execute(
        selectedDate.value.month.toString(),
        selectedDate.value.year.toString(),
      );
      print("============= Expenses: $expenses");
      this.expenses.assignAll(expenses);
      totalExpenses2.value = expenses.fold(0.0, (sum, e) => sum + e.amount);
      totalLeft.value = totalIncome.value - totalExpenses.value;
    } catch (e) {
      MyLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  Future<void> getTransactions() async {
    try {
      final transactions = await getTransactionsByMonthUsecase.execute(
        selectedDate.value.month.toString(),
        selectedDate.value.year.toString(),
      );
      this.transactions.assignAll(transactions);
      totalIncome.value = transactions
          .where((t) => t.transactionType == 'income')
          .fold(0.0, (sum, t) => sum + t.amount);
      totalExpenses.value = transactions
          .where((t) => t.transactionType == 'expense')
          .fold(0.0, (sum, t) => sum + t.amount);
      totalLeft.value = totalIncome.value - totalExpenses.value;
      noOfTransactions.value = transactions.length;
    } catch (e) {
      MyLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  Future<void> getRecentTransactions() async {
    try {
      final transactions = await getRecentTransactionsUsecase.execute();

      recentTransactionsCategories.clear();

      // Extract unique non-null category IDs
      final uniqueCategoryIds = transactions.map((t) => t.categoryId).toSet();

      if (uniqueCategoryIds.isNotEmpty) {
        final categoryFutures = uniqueCategoryIds.map((categoryId) =>
            getCategoryByIdUsecase.execute(categoryId)); // Safe null assertion

        final categories = await Future.wait(categoryFutures);
        recentTransactionsCategories.assignAll(categories);
        recentTransactions.assignAll(transactions);
      }
    } catch (e) {
      MyLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  Future<void> getMainBudget() async {
    try {
      mainBudget.value = await getMainBudgetUsecase.execute();
    } catch (e) {
      MyLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  void addMonth() async {
    if (selectedDate.value.month == DateTime.now().month) return;
    selectedDate.value =
        DateTime(selectedDate.value.year, selectedDate.value.month + 1);
    await getTransactions();
    await getMainBudget();
    await getRecentTransactions();
    await getExpenses();
  }

  void subtractMonth() async {
    selectedDate.value =
        DateTime(selectedDate.value.year, selectedDate.value.month - 1);
    await getTransactions();
    await getMainBudget();
    await getRecentTransactions();
    await getExpenses();
  }
}
