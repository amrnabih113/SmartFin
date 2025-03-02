// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/sepetarors/section_seperator.dart';
import 'package:smartFin/common/styles/gradiant_elevation_butoon.dart';
import 'package:smartFin/common/styles/gradiant_text.dart';
import 'package:smartFin/common/widgets/category_icon_container.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/common/widgets/mysection_heading.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/features/transactions/presentation/controllers/transactions_controller.dart';

class TransactionInfo extends StatelessWidget {
  const TransactionInfo({super.key});

  get title => null;

  @override
  Widget build(BuildContext context) {
    final transactionController =
        Get.put(TransactionsController(sl(), sl(), sl(), sl()));
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const MyAppBar(
        title: Text("New transaction"),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text(
                    "${transactionController.transactionType == "expense" ? "-" : "+"}${transactionController.amount}",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    transactionController.transactionType == "expense"
                        ? "Expense"
                        : "Income",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              SectionSeperator.doubleVertical(),
              Obx(
                () => Row(children: [
                  Text(
                    "Category: ",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  ItemSperator.halfHorizontal(),
                  GradientText(
                    text: transactionController.selectedCategory.value.name,
                    style: Theme.of(context).textTheme.titleSmall,
                    gradient: MyColors.customGradient(transactionController
                        .selectedCategory.value.materialColor),
                  ),
                ]),
              ),
              ItemSperator.vertical(),
              MySectionHeading(
                title: "Saved Categories",
                style: Theme.of(context).textTheme.titleLarge,
                showActionButton: true,
                isText: true,
              ),
              Obx(
                () => GridView.builder(
                  itemCount: transactionController.topFivecategories.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: MySizes.md,
                    mainAxisSpacing: MySizes.md,
                    mainAxisExtent: 60,
                  ),
                  itemBuilder: (_, index) {
                    final category =
                        transactionController.topFivecategories[index];
                    return Obx(
                      () => CategoryTile(
                        icon: category.iconData,
                        color: category.materialColor,
                        label: category.name,
                        isSelected: category ==
                            transactionController.selectedCategory.value,
                        onTap: () =>
                            transactionController.selectCategory(category),
                      ),
                    );
                  },
                ),
              ),
              ItemSperator.vertical(),
              Obx(
                () => ListTile(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(MySizes.lg),
                  ),
                  tileColor: isDark ? MyColors.darkContainer : MyColors.light,
                  leading: Icon(Iconsax.wallet,
                      color: isDark ? MyColors.white : MyColors.dark),
                  title: Text(
                    "Account",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  trailing: const Icon(Iconsax.arrow_right_3),
                  subtitle: Text(
                      transactionController.selectedAccount.value.name,
                      style: Theme.of(context).textTheme.labelMedium),
                  onTap: () async {
                    transactionController.showAccounts();
                  },
                ),
              ),
              ItemSperator.vertical(),
              Obx(
                () => ListTile(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(MySizes.lg),
                  ),
                  tileColor: isDark ? MyColors.darkContainer : MyColors.light,
                  leading: const Icon(Iconsax.calendar_2),
                  title: Text(
                      transactionController.date.value.day == DateTime.now().day
                          ? "Today"
                          : DateFormat("EEEE, MMM d")
                              .format(transactionController.date.value),
                      style: Theme.of(context).textTheme.titleLarge),
                  trailing: const Icon(Iconsax.arrow_right_3),
                  subtitle: Text(
                      transactionController.date.value.day == DateTime.now().day
                          ? "Now"
                          : DateFormat("hh:mm a")
                              .format(transactionController.date.value),
                      style: Theme.of(context).textTheme.labelMedium),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: transactionController.date.value,
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.dark(
                              surface: MyColors.darkContainer,
                              primary: MyColors.primaryColor,
                              onPrimary: MyColors.dark,
                              onSurface: MyColors.white,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: MyColors.white,
                              ),
                            ),
                            dialogBackgroundColor: MyColors.dark,
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (pickedDate != null) {
                      transactionController.date.value = pickedDate;
                    }
                  },
                ),
              ),
              ItemSperator.vertical(),
              const TextField(
                cursorColor: MyColors.primaryColor,
                decoration: InputDecoration(
                    hintText: "Write your comment ....",
                    prefixIcon: Icon(Iconsax.message)),
              ),
              ItemSperator.vertical(),
              SizedBox(
                width: double.infinity,
                child: GradientElevatedButton(
                  onPressed: () => transactionController.saveTransaction(),
                  child: Text(
                    "Save",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: MyColors.dark),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.icon,
    required this.color,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final MaterialColor color;
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(MySizes.sm),
        decoration: BoxDecoration(
          color: isSelected
              ? isDark
                  ? MyColors.selectedButton
                  : MyColors.grey
              : Colors.transparent,
          borderRadius: BorderRadius.circular(MySizes.md),
          border: Border.all(color: MyColors.primaryBorderDark),
        ),
        child: Row(
          children: [
            CategoryIconContainer(
              color: color,
              icon: icon,
            ),
            ItemSperator.halfHorizontal(),
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
