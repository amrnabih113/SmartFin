// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';

import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/sepetarors/section_seperator.dart';
import 'package:smartFin/common/styles/gradiant_elevation_butoon.dart';
import 'package:smartFin/common/styles/gradiant_text.dart';
import 'package:smartFin/common/widgets/category_icon_container.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/common/widgets/mysection_heading.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/auth/presentation/pages/sucssess_screen.dart';
import 'package:smartFin/features/transactions/presentation/pages/calculator_screen.dart';

class TransactionInfo extends StatelessWidget {
  const TransactionInfo({super.key});

  get title => null;

  @override
  Widget build(BuildContext context) {
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
                    "- \$300",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    "Expense",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              SectionSeperator.doubleVertical(),
              Row(children: [
                Text(
                  "Category: ",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                ItemSperator.halfHorizontal(),
                GradientText(
                  text: "Restaurants",
                  style: Theme.of(context).textTheme.titleSmall,
                  gradient: MyColors.customGradient(Colors.pink),
                ),
              ]),
              ItemSperator.vertical(),
              MySectionHeading(
                title: "Saved Categories",
                style: Theme.of(context).textTheme.titleLarge,
                showActionButton: true,
                isText: true,
              ),
              const Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CategoryTile(
                          icon: HugeIcons.strokeRoundedRestaurant01,
                          color: Colors.pink,
                          label: "Restaurants",
                          isSelected: true,
                        ),
                      ),
                      Expanded(
                        child: CategoryTile(
                          icon: Iconsax.health,
                          color: Colors.green,
                          label: "HealthCare",
                          isSelected: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySizes.md),
                  Row(
                    children: [
                      Expanded(
                        child: CategoryTile(
                          icon: HugeIcons.strokeRoundedWorkoutGymnastics,
                          color: Colors.blue,
                          label: "Fitness",
                          isSelected: false,
                        ),
                      ),
                      Expanded(
                        child: CategoryTile(
                          icon: HugeIcons.strokeRoundedMusicNote01,
                          color: Colors.orange,
                          label: "Entertainment",
                          isSelected: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MySizes.md),
                  Row(
                    children: [
                      Expanded(
                        child: CategoryTile(
                          icon: HugeIcons.strokeRoundedShoppingBag01,
                          color: Colors.cyan,
                          label: "Groceries",
                          isSelected: false,
                        ),
                      ),
                      Spacer(), // To balance the last row if only one item
                    ],
                  ),
                ],
              ),
              ItemSperator.vertical(),
              ListTile(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(MySizes.lg),
                ),
                tileColor: isDark ? MyColors.darkContainer : MyColors.light,
                leading: Icon(Iconsax.wallet,
                    color: isDark ? MyColors.white : MyColors.dark),
                title: Text(
                  "Payment Method",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                trailing: const Icon(Iconsax.arrow_right_3),
                subtitle: Text("Cash",
                    style: Theme.of(context).textTheme.labelMedium),
                onTap: () {},
              ),
              ItemSperator.vertical(),
              ListTile(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(MySizes.lg),
                ),
                tileColor: isDark ? MyColors.darkContainer : MyColors.light,
                leading: const Icon(Iconsax.calendar_2),
                title: Text("Today",
                    style: Theme.of(context).textTheme.titleLarge),
                trailing: const Icon(Iconsax.arrow_right_3),
                subtitle: Text("12:00 PM",
                    style: Theme.of(context).textTheme.labelMedium),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
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
                    print("Selected Date: ${pickedDate.toLocal()}");
                  }
                },
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
                  onPressed: () => Get.to(SuccessScreen(
                      image: MyImages.successAnimation,
                      onPressed: () => Get.offUntil(
                            GetPageRoute(page: () => const CalculatorScreen()),
                            (route) => route.isFirst,
                          ),
                      title: "Transaction Saved",
                      subtitle:
                          "Your transaction has been added successfully")),
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
  });

  final IconData icon;
  final MaterialColor color;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Container(
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
    );
  }
}
