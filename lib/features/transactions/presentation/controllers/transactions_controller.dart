import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/styles/gradiant_elevation_butoon.dart';
import 'package:smartFin/common/styles/gradiant_icon.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/constants/texts.dart';
import 'package:smartFin/core/local_storage/my_local_storage.dart';
import 'package:smartFin/core/utils/popups/full_screen_loader.dart';
import 'package:smartFin/core/utils/popups/loaders.dart';
import 'package:smartFin/features/accounts/domain/entites/account_entity.dart';
import 'package:smartFin/features/accounts/domain/usecases/fetch_accounts_usecase.dart';
import 'package:smartFin/features/accounts/presentation/pages/add_new_account_screen.dart';
import 'package:smartFin/features/auth/presentation/pages/sucssess_screen.dart';
import 'package:smartFin/features/categories/domain/entities/category_entity.dart';
import 'package:smartFin/features/categories/domain/usecases/get_top_five_category_usecase.dart';
import 'package:smartFin/features/transactions/data/models/transactions_model.dart';
import 'package:smartFin/features/transactions/domain/usecases/add_transaction_usecase.dart';
import 'package:smartFin/features/transactions/presentation/controllers/calculator_conreoller.dart';
import 'package:smartFin/generated/l10n.dart';
import 'package:smartFin/navigation_menu.dart';
import 'package:uuid/uuid.dart';

class TransactionsController extends GetxController {
  final AddTransactionUsecase addTransaction;
  final GetTopFiveCategoryUsecase getTopFiveCategoriesUseCase;
  final FetchAccountsUsecase fetchAccountsUsecase;
  final MyLocalStorage myLocalStorage;

  TransactionsController(
    this.addTransaction,
    this.getTopFiveCategoriesUseCase,
    this.fetchAccountsUsecase,
    this.myLocalStorage,
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
  Rx<AccountEntity> selectedAccount = AccountEntity.empty().obs;
  RxInt budgetId = (-1).obs;
  final local = AppLocalizations.current;
  final RxList<AccountEntity> accounts = <AccountEntity>[].obs;

  @override
  void onInit() async {
    super.onInit();
    amount = double.tryParse(calculatorController.amount.value) ?? 0.0;
    transactionType = calculatorController.selectedCategory.value
        .toString(); // Ensure it's a string
    await getCategories();
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
      if (selectedAccount.value.id.isEmpty) {
        MyLoaders.warningSnackBar(
            title: "Warning", message: "Please select an account.");
        MyFullScreenLoader.stopLoading();
        return;
      }
      final userId = myLocalStorage.readData<String>(MyTexts.userId);
      if (userId == null) {
        MyLoaders.warningSnackBar(title: "Warning", message: "User not found.");
        MyFullScreenLoader.stopLoading();
        return;
      }
      final newTransaction = TransactionsModel(
        id: const Uuid().v4(),
        userId: userId,
        categoryId: categoryId.value,
        accountId: selectedAccount.value.id,
        budgetId: (budgetId.value == -1 ? null : budgetId.value.toString()),
        amount: amount,
        transactionType: transactionType,
        note: noteController.text,
        date: date.value,
        syncStatus: 'pending',
      );
      print("starting==================================================");
      await addTransaction.execute(newTransaction);
      print("ending==================================================");
      MyFullScreenLoader.stopLoading();

      Get.to(() => SuccessScreen(
          image: MyImages.successAnimation,
          onPressed: () => Get.offAll(() => const NavigationMenu()),
          title: "Transaction Saved",
          subtitle: "Your transaction has been added successfully"));
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

  void selectAccount(AccountEntity account) {
    selectedAccount.value = account;
  }

  void showAccounts() async {
    if (accounts.isEmpty) {
      final fetchedAccounts = await fetchAccountsUsecase.execute();
      accounts.value = fetchedAccounts;
    }
    Get.bottomSheet(
      backgroundColor: MyColors.dark,
      elevation: 0,
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(MySizes.md),
          decoration: const BoxDecoration(
            color: MyColors.dark,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              Obx(() {
                if (accounts.isEmpty) {
                  return const Center(
                    child: Text('No accounts available.',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: accounts.length,
                  itemBuilder: (context, index) {
                    final account = accounts[index];
                    return Card(
                      color: MyColors.darkContainer,
                      child: ListTile(
                        title: Text(account.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: Colors.white)),
                        leading: const GradientIcon(
                          icon: Icons.account_balance_wallet,
                        ),
                        onTap: () {
                          selectAccount(account);
                          Get.back(); // Close bottom sheet on selection
                        },
                      ),
                    );
                  },
                );
              }),
              ItemSperator.vertical(),
              SizedBox(
                width: double.infinity,
                child: GradientElevatedButton(
                  onPressed: () => Get.to(() => const AddNewAccountScreen()),
                  child: Text(
                    "Add Account",
                    style: Theme.of(Get.context!)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: MyColors.dark),
                  ),
                ),
              ),
              ItemSperator.vertical(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onClose() {
    noteController.dispose();
    super.onClose();
  }
}
