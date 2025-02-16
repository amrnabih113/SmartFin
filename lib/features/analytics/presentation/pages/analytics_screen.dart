import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/sepetarors/section_seperator.dart';
import 'package:smartFin/common/widgets/add_category_button.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/common/charts/custom_bar_chart.dart';
import 'package:smartFin/features/analytics/presentation/widgets/income_list_tile.dart';
import 'package:smartFin/common/widgets/period_buttons.dart';
import 'package:smartFin/generated/l10n.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppBar(
          title: Text(
        AppLocalizations.current.analytics,
        style: Theme.of(context).textTheme.headlineSmall,
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpacing),
          child: Column(
            children: [
              const PeriodButtons(),
              ItemSperator.vertical(),
              const AnalyticsChart(),
              SectionSeperator.vertical(),
              Container(
                padding: const EdgeInsets.all(MySizes.defaultSpacing),
                decoration: BoxDecoration(
                  color: isDark ? MyColors.darkContainer : MyColors.light,
                  borderRadius: BorderRadius.circular(MySizes.md),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Income",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    ItemSperator.doubleVertical(),
                    const IncomeListTile(
                      title: "Salary",
                      amount: "\$5000",
                      icon: Iconsax.wallet_1,
                      color: Colors.amber,
                    ),
                    ItemSperator.vertical(),
                    const IncomeListTile(
                      title: "Gift",
                      amount: "\$2000",
                      icon: Iconsax.gift,
                      color: Colors.green,
                    ),
                    ItemSperator.vertical(),
                    const IncomeListTile(
                      title: "Investments",
                      amount: "\$3000",
                      icon: Iconsax.chart_1,
                      color: Colors.blue,
                    ),
                    ItemSperator.vertical(),
                    const AddCategoryListTile()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnalyticsChart extends StatelessWidget {
  const AnalyticsChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(MySizes.defaultSpacing),
      decoration: BoxDecoration(
          color: isDark ? MyColors.darkContainer : MyColors.light,
          borderRadius: BorderRadius.circular(MySizes.md)),
      child: Column(
        children: [
          const CustomBarChart(
            bars: [20, 50, 80, 30, 40, 80],
            labels: [
              "Jan",
              "Feb",
              "Mar",
              "Apr",
              "May",
              "Jun",
            ],
          ),
          ItemSperator.vertical(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    padding: const EdgeInsets.all(0),
                  ),
                  child: Text(
                    "Income",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              ItemSperator.halfHorizontal(),
              SizedBox(
                width: 100,
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    padding: const EdgeInsets.all(0),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Text(
                    "Expenses",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
