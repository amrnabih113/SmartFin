import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smartFin/common/charts/pie_chart.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/common/widgets/mysection_heading.dart';
import 'package:smartFin/common/widgets/period_buttons.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/expenses/presentation/controllers/expences_controller.dart';
import 'package:smartFin/generated/l10n.dart';

class ExpencesScreen extends StatelessWidget {
  const ExpencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExpencesController());
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          AppLocalizations.current.expenses,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
            icon: const Icon(HugeIcons.strokeRoundedCalendar03),
            onPressed: () => controller.selectPeriod(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const MyPieChart(sections: [2, 5, 10, 7, 3]),
                  Column(children: [
                    Text(
                      AppLocalizations.current.spentThisMonth,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      "\$ 2,300",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ])
                ],
              ),
              ItemSperator.vertical(),
              const PeriodButtons(),
              ItemSperator.vertical(),
              MySectionHeading(
                title: "Spending Categories",
                style: Theme.of(context).textTheme.titleMedium,
                showActionButton: true,
              ),
              ItemSperator.vertical(),
              Row(children: [
                const Expanded(
                  child: ExpenceContainer(
                    amount: "\$ 100.05",
                    percentage: "10%",
                    title: "Groceries",
                    color: Colors.green,
                  ),
                ),
                ItemSperator.halfHorizontal(),
                const Expanded(
                  child: ExpenceContainer(
                    amount: "\$ 300.05",
                    percentage: "30%",
                    title: "Entertainment",
                    color: Colors.yellow,
                  ),
                ),
              ]),
              ItemSperator.vertical(),
              Row(children: [
                const Expanded(
                  child: ExpenceContainer(
                    amount: "\$ 600.05",
                    percentage: "40%",
                    title: "Shopping",
                    color: Colors.purple,
                  ),
                ),
                ItemSperator.halfHorizontal(),
                const Expanded(
                  child: ExpenceContainer(
                    amount: "\$ 200.05",
                    percentage: "20%",
                    title: "Transport",
                    color: Colors.red,
                  ),
                ),
              ]),
              ItemSperator.vertical(),
              Row(children: [
                const Expanded(
                  child: ExpenceContainer(
                    amount: "\$ 20.05",
                    percentage: "5%",
                    title: "Others",
                    color: Colors.cyan,
                  ),
                ),
                ItemSperator.halfHorizontal(),
                const Spacer(),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class ExpenceContainer extends StatelessWidget {
  const ExpenceContainer({
    required this.amount,
    required this.percentage,
    required this.title,
    required this.color,
    super.key,
  });

  final String amount;
  final String percentage;
  final String title;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(MySizes.sm),
      decoration: BoxDecoration(
        color: isDark ? MyColors.darkContainer : MyColors.light,
        borderRadius: BorderRadius.circular(MySizes.md),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Text(
            amount,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          Text(
            percentage,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ]),
        ItemSperator.halfVertical(),
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        ItemSperator.halfVertical(),
        ClipOval(
            child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              gradient: MyColors.customGradient(color), shape: BoxShape.circle),
        ))
      ]),
    );
  }
}
