import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';

class TranscationHeader extends StatelessWidget {
  const TranscationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Container(
        padding: const EdgeInsets.all(MySizes.defaultSpacing),
        decoration: BoxDecoration(
            color: isDark ? MyColors.darkContainer : MyColors.light,
            borderRadius: BorderRadius.circular(MySizes.md)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                onPressed: () {}, icon: const Icon(Iconsax.arrow_left_2)),
            Column(children: [
              Text(
                "Septamber 2024",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ItemSperator.halfVertical(),
              Text(
                "12 Transactions",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ]),
            IconButton(
                onPressed: () {}, icon: const Icon(Iconsax.arrow_right_3))
          ]),
          ItemSperator.vertical(),
          Container(
            padding: const EdgeInsets.all(MySizes.defaultSpacing),
            decoration: BoxDecoration(
                color: isDark ? MyColors.primaryBorderDark : MyColors.white,
                borderRadius: BorderRadius.circular(MySizes.md)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "\$4000",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "Income",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "\$2000",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "Expense",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "\$1000",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "Balance",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ]),
          )
        ]));
  }
}
