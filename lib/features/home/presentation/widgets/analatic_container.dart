import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/widgets/my_filled_button.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/formatters/dateformater.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/home/presentation/controllers/my_household_controller.dart';
import 'package:smartFin/features/home/presentation/widgets/budget_chart.dart';
import 'package:smartFin/generated/l10n.dart';
import 'package:smartFin/navigation_menu.dart';

class AnalyticContainer extends StatelessWidget {
  const AnalyticContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = MyHouseholdController.instance;
    final navigationController = NavigationController.instance;
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(MySizes.defaultSpacing),
      decoration: BoxDecoration(
          color: isDark ? MyColors.darkContainer : MyColors.light,
          borderRadius: BorderRadius.circular(MySizes.md)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.current.analysis,
              style: Theme.of(context).textTheme.titleLarge),
          ItemSperator.vertical(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                onPressed: () {
                  controller.subtractMonth();
                },
                icon: const Icon(Iconsax.arrow_left_2)),
            Obx(
              () => Column(children: [
                Text(
                  MyDateFormatter.dateStringMonthYear(
                      controller.selectedDate.value),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ItemSperator.halfVertical(),
                Text(
                  "${controller.noOfTransactions} Tarnsactions",
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ]),
            ),
            IconButton(
                onPressed: () {
                  controller.addMonth();
                },
                icon: const Icon(Iconsax.arrow_right_3))
          ]),
          Obx(() {
            if (controller.noOfTransactions.value == 0) {
              return Column(
                children: [
                  ItemSperator.vertical(),
                  Center(
                    child: Text(AppLocalizations.current.noTransactions,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          }),
          ItemSperator.vertical(),
          Obx(() => BudgetChart(
              income: controller.totalIncome.value,
              expenses: controller.totalExpenses.value,
              left: controller.totalLeft.value)),
          ItemSperator.vertical(),
          MyFilledButton(
            text: AppLocalizations.current.viewMore,
            icon: Icons.arrow_forward,
            onPressed: () {
              navigationController.selectedIndex.value = 2;
            },
          )
        ],
      ),
    );
  }
}
