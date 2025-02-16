import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/styles/gradiant_icon.dart';
import 'package:smartFin/common/styles/gradiant_text.dart';
import 'package:smartFin/common/widgets/add_button.dart';
import 'package:smartFin/common/widgets/budget_progress_bar.dart';
import 'package:smartFin/common/widgets/my_profile_image.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/home/presentation/controllers/my_household_controller.dart';

class BalanceContainer extends StatelessWidget {
  const BalanceContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    final controller = Get.put(MyHouseholdController());
    return Container(
        padding: const EdgeInsets.all(MySizes.defaultSpacing),
        decoration: BoxDecoration(
            color: isDark ? MyColors.darkContainer : MyColors.light,
            borderRadius: BorderRadius.circular(MySizes.md)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyProfileImage(
                  image: MyImages.profileImage,
                  isNetworkImage: false,
                  radius: 40,
                ),
                ItemSperator.halfVertical(),
                Column(children: [
                  Text(
                    "Welcome Back",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    "Amr Nabih",
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ])
              ],
            ),
          ),
          ItemSperator.vertical(),
          const BudgetProgressBar(currentAmount: 6000, totalBudget: 9000),
          ItemSperator.vertical(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Current Balance",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Obx(
                    () => Row(
                      children: [
                        Text(
                          !controller.showBalance.value
                              ? "********"
                              : "\$ 3000.25",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        IconButton(
                            onPressed: () => controller.showBalance.value =
                                !controller.showBalance.value,
                            icon: controller.showBalance.value
                                ? const Icon(Iconsax.eye)
                                : const Icon(Iconsax.eye_slash)),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  GradientText(
                    text: "Cash",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  PopupMenuButton<String>(
                    offset: const Offset(0, 40),
                    color: isDark ? MyColors.dark : MyColors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySizes.md))),
                    icon: const GradientIcon(
                      icon: Iconsax.arrow_down_1,
                      size: 15,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: "Cash",
                        child: Text(
                          "Cash",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      PopupMenuItem(
                        value: "Credit Card",
                        child: Text(
                          "Credit Card",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      PopupMenuItem(
                        value: "Add Account",
                        child: Row(
                          children: [
                            const AddButton(
                              size: 20,
                            ),
                            ItemSperator.halfHorizontal(),
                            Text(
                              "Add Account",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      )
                    ],
                    onSelected: (value) {},
                  )
                ],
              )
            ],
          ),
        ]));
  }
}
