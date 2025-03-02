import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smartFin/config/routing/screen_redirect.dart';
import 'package:smartFin/core/constants/texts.dart';
import 'package:smartFin/core/local_storage/my_local_storage.dart';
import 'package:smartFin/core/utils/popups/loaders.dart';
import 'package:smartFin/features/accounts/domain/entites/account_entity.dart';
import 'package:smartFin/features/accounts/domain/usecases/add_account_usecase.dart';
import 'package:smartFin/features/accounts/domain/usecases/fetch_accounts_usecase.dart';
import 'package:uuid/uuid.dart';

class AccountsController extends GetxController {
  static AccountsController get instance => Get.find();

  final AddAccountUsecase addAccountUsecase;
  final FetchAccountsUsecase fetchAccountsUsecase;
  final MyLocalStorage localStorage = MyLocalStorage.instance();
  final GetStorage getStorage = GetStorage();

  AccountsController(
      {required this.addAccountUsecase, required this.fetchAccountsUsecase});

  final RxList accounts = <AccountEntity>[].obs;
  final RxString cashAmount = "0".obs;
  final RxBool showPassword = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

  @override
  onInit() async {
    accounts.value = await fetchAccountsUsecase.execute();
    super.onInit();
  }

  Future<void> setTheCashAccount() async {
    final userId = localStorage.readData<String>(MyTexts.userId);
    if (userId == null) {
      MyLoaders.errorSnackBar(
        title: "Error",
        message: "User not found",
      );
      return;
    }
    try {
      if (formKey.currentState!.validate() == false) {
        return;
      }

      final String currency = getStorage.read(MyTexts.currency) ?? "\$";
      final AccountEntity cashAccount = AccountEntity(
        id: const Uuid().v4(),
        userId: userId,
        name: "Cash",
        isMain: 1,
        balance: double.parse(cashAmount.value),
        currency: currency,
        password: passwordController.text.trim(),
        isFamilyBudget: 0,
      );
      await addAccountUsecase.execute(cashAccount);
      await getStorage.write(MyTexts.setcash, true);
      await ScreenRedirect.instance.screenRedirect();
    } catch (e) {
      MyLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  void onKeyTap(String value) {
    if (value == "⌫") {
      if (cashAmount.value.isNotEmpty) {
        cashAmount.value =
            cashAmount.value.substring(0, cashAmount.value.length - 1);
        if (cashAmount.value.isEmpty) cashAmount.value = "0";
      }
    } else if (value == "AC") {
      cashAmount.value = "0";
    } else {
      if (cashAmount.value == "0") {
        cashAmount.value = value;
      } else {
        cashAmount.value += value;
      }
    }
  }
}
