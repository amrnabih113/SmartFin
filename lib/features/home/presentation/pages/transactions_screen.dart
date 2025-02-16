import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/widgets/mysection_heading.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/home/presentation/widgets/transaction_list_tile.dart';
import 'package:smartFin/features/home/presentation/widgets/transcation_header.dart';
import 'package:smartFin/generated/l10n.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpacing),
        child: Column(
          children: [
            const TranscationHeader(),
            MySectionHeading(
                title: AppLocalizations.current.transcations,
                showActionButton: true),
            ItemSperator.halfVertical(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Dash(
                  direction: Axis.horizontal,
                  length: 220,
                  dashLength: 4,
                  dashColor: isDark ? MyColors.darkGrey : MyColors.dark,
                ),
                Text(
                  "\$200.00",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            ItemSperator.halfVertical(),
            ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const TransactionListTile(
                    icon: Iconsax.heart4,
                    color: Colors.pink,
                    title: "HealthCare",
                    subtitle: "Today 2:00 PM",
                    trailing: "\$100.00",
                  ),
                  ItemSperator.halfVertical(),
                  const TransactionListTile(
                    icon: HugeIcons.strokeRoundedSpoonAndFork,
                    color: Colors.blue,
                    title: "Food",
                    subtitle: "Today 4:00 PM",
                    trailing: "\$80.00",
                  ),
                  ItemSperator.halfVertical(),
                ]),
            const TransactionListTile(
              icon: HugeIcons.strokeRoundedCar01,
              color: Colors.green,
              title: "Transportation",
              subtitle: "Today 4:00 PM",
              trailing: "\$20.00",
            ),
            ItemSperator.doubleVertical(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Yesterday",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Dash(
                  direction: Axis.horizontal,
                  length: 220,
                  dashLength: 4,
                  dashColor: isDark ? MyColors.darkGrey : MyColors.dark,
                ),
                Text(
                  "\$800.00",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            ItemSperator.vertical(),
            ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const TransactionListTile(
                    icon: Iconsax.heart4,
                    color: Colors.pink,
                    title: "Health",
                    subtitle: "Today 2:00 PM",
                    trailing: "\$100.00",
                  ),
                  ItemSperator.halfVertical(),
                  const TransactionListTile(
                    icon: HugeIcons.strokeRoundedSpoonAndFork,
                    color: Colors.blue,
                    title: "Food",
                    subtitle: "Today 4:00 PM",
                    trailing: "\$80.00",
                  ),
                  ItemSperator.halfVertical(),
                ]),
            const TransactionListTile(
              icon: HugeIcons.strokeRoundedCar01,
              color: Colors.green,
              title: "Transportation",
              subtitle: "Today 4:00 PM",
              trailing: "\$80.00",
            ),
            ItemSperator.halfVertical(),
          ],
        ),
      ),
    );
  }
}
