

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/widgets/my_filled_button.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/home/presentation/widgets/budget_chart.dart';
import 'package:smartFin/generated/l10n.dart';
class AnalyticContainer extends StatelessWidget {
  const AnalyticContainer({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.current.analysis,
              style: Theme.of(context).textTheme.titleLarge),
          ItemSperator.vertical(),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.arrow_left_2)),
                Column(children: [
                  Text(
                    "Septamber 2024",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ItemSperator.halfVertical(),
                  Text(
                    "12 Tarnsactions",
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ]),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.arrow_right_3))
              ]),
          ItemSperator.vertical(),
          const BudgetChart(income: 300, expenses: 120, left: 180),
          ItemSperator.vertical(),
          MyFilledButton(
            text: AppLocalizations.current.viewMore,
            icon: Icons.arrow_forward,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
