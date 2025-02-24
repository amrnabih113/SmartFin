import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/utils/popups/full_screen_loader.dart';
import 'package:smartFin/core/utils/popups/loaders.dart';
import 'package:smartFin/features/auth/presentation/pages/sucssess_screen.dart';
import 'package:smartFin/features/categories/domain/entities/category_entity.dart';
import 'package:smartFin/features/categories/domain/usecases/categories_usecases.dart';
import 'package:smartFin/features/transactions/data/models/transactions_model.dart';
import 'package:smartFin/features/transactions/domain/usecases/add_transaction.dart';
import 'package:smartFin/features/transactions/presentation/controllers/calculator_conreoller.dart';
import 'package:smartFin/features/transactions/presentation/pages/calculator_screen.dart';
import 'package:smartFin/generated/l10n.dart';
import 'package:uuid/uuid.dart';

class TransactionsController extends GetxController {
  final AddTransaction addTransaction;
  final GetTopFiveCategoriesUseCase getTopFiveCategoriesUseCase;

  TransactionsController(
    this.addTransaction,
    this.getTopFiveCategoriesUseCase,
  );

  final CalculatorController calculatorController =
      CalculatorController.instance;

  late final double amount;
  late final String transactionType;
  final TextEditingController noteController = TextEditingController();
  final RxList<CategoryEntity> topFivecategories = <CategoryEntity>[].obs;
  Rx<DateTime> date = DateTime.now().obs;
  Rx<CategoryEntity> selectedCategory = CategoryEntity.empty().obs;
  RxString categoryId = "".obs;
  RxInt accountId = 0.obs;
  RxInt budgetId = (-1).obs;
  final local = AppLocalizations.current;

  @override
  void onInit() {
    super.onInit();
    amount = double.tryParse(calculatorController.amount.value) ?? 0.0;
    transactionType = calculatorController.selectedCategory.value
        .toString(); // Ensure it's a string
    getCategories();
  }

  void saveTransaction() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          local.processingYourRequest, MyImages.docerAnimation);

      if (amount == 0.0) {
        MyLoaders.warningSnackBar(
            title: "Warning", message: "Please enter an amount.");
        MyFullScreenLoader.stopLoading();
        return;
      }
      if (categoryId.value.isEmpty) {
        MyLoaders.warningSnackBar(
            title: "Warning", message: "Please select a category.");
        MyFullScreenLoader.stopLoading();
        return;
      }

      final newTransaction = TransactionsModel(
        id: const Uuid().v4(),
        userId: '',
        categoryId: categoryId.value,
        accountId: accountId.value.toString(),
        budgetId: budgetId.value.toString(),
        amount: amount,
        transactionType: transactionType,
        note: noteController.text,
        date: date.value,
        syncStatus: 'pending',
      );

      await addTransaction.call(newTransaction);

      Get.off(() => SuccessScreen(
          image: MyImages.successAnimation,
          onPressed: () => Get.offAll(() => const CalculatorScreen()),
          title: "Transaction Saved",
          subtitle: "Your transaction has been added successfully"));

      MyFullScreenLoader.stopLoading();
    } catch (e) {
      MyLoaders.errorSnackBar(title: "Error", message: e.toString());
      MyFullScreenLoader.stopLoading();
    }
  }

  Future<void> getCategories() async {
    try {
      final categories = await getTopFiveCategoriesUseCase(transactionType);

      topFivecategories.value = categories;
    } catch (e) {
      MyLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  void selectCategory(CategoryEntity category) {
    selectedCategory.value = category;
    categoryId.value = category.id;
  }

  @override
  void onClose() {
    noteController.dispose();
    super.onClose();
  }
}
