import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/common/styles/gradiant_fab.dart';
import 'package:smartFin/common/styles/gradiant_icon.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/features/accounts/domain/entites/account_entity.dart';
import 'package:smartFin/features/accounts/presentation/controllers/accounts_controller.dart';
import 'package:smartFin/features/accounts/presentation/pages/account_details_screen.dart';
import 'package:smartFin/features/accounts/presentation/pages/add_new_account_screen.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AccountsController(
        addAccountUsecase: sl(),
        fetchAccountsUsecase: sl()));

    return Scaffold(
      floatingActionButton: GradientFAB(
          onPressed: () => Get.to(() => const AddNewAccountScreen())),
      appBar: const MyAppBar(
        title: Text("Accounts"),
        isCenter: true,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpacing),
        child: Obx(() {
          if (controller.accounts.isEmpty) {
            return const Center(child: Text("No accounts found."));
          }

          return ListView.builder(
            itemCount: controller.accounts.length,
            itemBuilder: (context, index) {
              final AccountEntity account = controller.accounts[index];
              return Card(
                elevation: 5,
                color: MyColors.darkContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                      color: MyColors.primaryBorderDark, width: 1),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(MySizes.sm),
                  leading: const GradientIcon(
                      icon: Icons.account_balance_wallet, size: 30),
                  title: Text(account.name,
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text("Balance: \$${account.balance}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      _showAccountOptions(context, account);
                    },
                  ),
                  onTap: () {
                    Get.to(() => AccountDetailsScreen(account: account));
                  },
                ),
              );
            },
          );
        }),
      ),
    );
  }

  void _showAccountOptions(BuildContext context, AccountEntity account) {
    showModalBottomSheet(
      backgroundColor: MyColors.dark,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Edit Account"),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text("Delete Account"),
              onTap: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
