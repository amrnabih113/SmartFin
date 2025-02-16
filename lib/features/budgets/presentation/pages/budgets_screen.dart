import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/styles/gradiant_icon.dart';
import 'package:smartFin/common/widgets/budget_progress_bar.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/common/widgets/mysection_heading.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/budgets/presentation/widgets/budget_list_tile.dart';

class BudgetsScreen extends StatelessWidget {
  const BudgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppBar(
        leadingIcon: HugeIcons.strokeRoundedSearch02,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const GradientIcon(
              icon: Iconsax.add,
              size: 30,
            ),
          )
        ],
        title: Text(
          "Budgets",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(MySizes.defaultSpacing),
        child: Column(
          children: [
            // Total Budget Section
            Container(
              padding: const EdgeInsets.all(MySizes.defaultSpacing),
              decoration: BoxDecoration(
                color: isDark ? MyColors.darkContainer : MyColors.light,
                borderRadius: BorderRadius.circular(MySizes.md),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total Budget",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "\$4000",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: MySizes.defaultSpacing),
                  const BudgetProgressBar(
                    currentAmount: 3800,
                    totalBudget: 4000,
                  ),
                  const SizedBox(height: MySizes.defaultSpacing),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.faceSadTear,
                            size: 15,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Left : ",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            "\$200",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const GradientIcon(
                          size: 20,
                          icon: HugeIcons.strokeRoundedEdit02,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: MySizes.defaultSpacing),

            // Limits Section
            const MySectionHeading(
              title: "Limits",
              showActionButton: true,
              isText: true,
            ),
            const SizedBox(height: MySizes.defaultSpacing),

            // Budget Items
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const BudgetListTile(
                  title: "Groceries",
                  remaining: "\$100",
                  currentAmount: 200,
                  totalBudget: 300,
                  color: Colors.green,
                  icon: HugeIcons.strokeRoundedShoppingBag02,
                ),
                ItemSperator.doubleVertical(),
                const BudgetListTile(
                  title: "Transportation",
                  remaining: "\$20",
                  currentAmount: 180,
                  totalBudget: 200,
                  color: Colors.blue,
                  icon: HugeIcons.strokeRoundedCar02,
                ),
                ItemSperator.doubleVertical(),
                const BudgetListTile(
                  title: "Restaurants",
                  remaining: "\$400",
                  currentAmount: 300,
                  totalBudget: 700,
                  color: Colors.purple,
                  icon: HugeIcons.strokeRoundedRestaurant03,
                ),
                ItemSperator.doubleVertical(),
                const BudgetListTile(
                  title: "Healthcare",
                  remaining: "\$0",
                  currentAmount: 800,
                  totalBudget: 700,
                  color: Colors.brown,
                  icon: HugeIcons.strokeRoundedHeartbreak,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
