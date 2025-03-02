import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/core/utils/popups/loaders.dart';
import 'package:smartFin/features/accounts/domain/entites/account_entity.dart';
import 'package:smartFin/features/categories/domain/entities/category_entity.dart';
import 'package:smartFin/features/categories/domain/usecases/get_category_by_id_usecase.dart';
import 'package:smartFin/features/transactions/domain/entites/transactions_entity.dart';
import 'package:smartFin/features/transactions/domain/usecases/get_transactions_by_account_usecase.dart';

class AccountDetailsController extends GetxController {
  static AccountDetailsController get instance => Get.find();

  final AccountEntity account;
  final RxList<TransactionEntity> transactions = <TransactionEntity>[].obs;
  final GetTransactionsByAccountUsecase getTransactionsByAccountUsecase;
  final GetCategoryByIdUsecase getCategoryByIdUsecase;
  final RxBool isBalanceVisible = false.obs;
  final RxList<CategoryEntity> transactionCategories = <CategoryEntity>[].obs;
  final TextEditingController passwordController = TextEditingController();

  AccountDetailsController({
    required this.getTransactionsByAccountUsecase,
    required this.account,
    required this.getCategoryByIdUsecase,
  });

  @override
  onInit() {
    super.onInit();
    getTransactionsByAccount();
  }

  Future<void> getTransactionsByAccount() async {
    try {
      final accountId = account.id;
      final fetchedTransactions =
          await getTransactionsByAccountUsecase.execute(accountId);

      if (fetchedTransactions.isEmpty) {
        transactions.value = [];
        return;
      }

      transactionCategories.clear();
      for (var transaction in fetchedTransactions) {
        final category =
            await getCategoryByIdUsecase.execute(transaction.categoryId);
        transactionCategories.add(category);
      }

      transactions.value = fetchedTransactions;
    } catch (e) {
      MyLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  List<FlSpot> getBalanceSpots() {
    if (transactions.isEmpty) {
      // If there are no transactions, return a flat line at the account balance
      return [FlSpot(0, account.balance), FlSpot(1, account.balance)];
    }

    List<FlSpot> spots = [];
    double balance = account.balance;

    // Sort transactions by date to process in order
    List<TransactionEntity> sortedTransactions = List.from(transactions);
    sortedTransactions.sort((a, b) => a.date.compareTo(b.date));

    DateTime startDate = sortedTransactions.first.date;
    spots.add(FlSpot(0, balance)); // Start with initial balance

    for (var transaction in sortedTransactions) {
      balance += transaction.amount; // Update balance
      double daysSinceStart =
          transaction.date.difference(startDate).inDays.toDouble();
      spots.add(FlSpot(daysSinceStart, balance));
    }

    // If all points have the same balance, ensure a straight line
    if (spots.every((spot) => spot.y == spots.first.y)) {
      return [FlSpot(0, spots.first.y), FlSpot(1, spots.first.y)];
    }

    return spots;
  }

  void checkPassword(String password) {
    if (password == account.password) {
      isBalanceVisible.value = true;
    } else {
      MyLoaders.errorSnackBar(title: "Error", message: "Incorrect Password");
    }
  }

  void showPasswordDialog() {
    Get.defaultDialog(
      title: "Enter Password",
      content: TextField(
        controller: passwordController,
        obscureText: true,
        decoration: const InputDecoration(hintText: "Password"),
      ),
      textCancel: "Cancel",
      textConfirm: "Confirm",
      onConfirm: () {
        checkPassword(passwordController.text);
        Get.back();
      },
    );
  }
}
