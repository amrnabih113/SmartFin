import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/common/charts/pie_chart.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/widgets/my_filled_button.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/formatters/dateformater.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/home/presentation/controllers/my_household_controller.dart';
import 'package:smartFin/generated/l10n.dart';
import 'package:smartFin/navigation_menu.dart';

class ExpensesContainer extends StatelessWidget {
  const ExpensesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MyHouseholdController.instance;
    final navigationController = NavigationController.instance;
    final isDark = MyHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.all(MySizes.defaultSpacing),
      decoration: BoxDecoration(
        color: isDark ? MyColors.darkContainer : MyColors.light,
        borderRadius: BorderRadius.circular(MySizes.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.current.expenses,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ItemSperator.vertical(),
          Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Obx(() => Column(
                      children: [
                        Text(
                          controller.selectedDate.value.month ==
                                  DateTime.now().month
                              ? 'Spend This Month'
                              : MyDateFormatter.dateStringMonthYear(
                                  controller.selectedDate.value),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          '\$${controller.totalExpenses2.value.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    )),
                Obx(() {
                  if (controller.totalExpenses2.value == 0) {
                    return const MyPieChart(
                      sections: [1],
                      colors: [Colors.grey],
                    );
                  } else {
                    return MyPieChart(
                      sections: controller.expenses
                          .fold<Map<int, double>>({}, (map, element) {
                            map[int.parse(element.categoryId)] =
                                (map[element.categoryId] ?? 0) + element.amount;
                            return map;
                          })
                          .values
                          .toList(),
                    );
                  }
                }),
              ],
            ),
          ),
          ItemSperator.vertical(),
          MyFilledButton(
            text: AppLocalizations.current.viewMore,
            icon: Icons.arrow_forward,
            onPressed: () {
              navigationController.selectedIndex.value = 3;
            },
          ),
        ],
      ),
    );
  }
}
