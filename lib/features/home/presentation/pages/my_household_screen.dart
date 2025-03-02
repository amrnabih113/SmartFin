import 'package:flutter/material.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/features/home/presentation/widgets/analatic_container.dart';
import 'package:smartFin/features/home/presentation/widgets/balance_container.dart';
import 'package:smartFin/features/home/presentation/widgets/expences_container.dart';
import 'package:smartFin/features/home/presentation/widgets/recent_transaction_list.dart';
import 'package:smartFin/features/home/presentation/widgets/share_container.dart';

class MyHouseholdScreen extends StatelessWidget {
  const MyHouseholdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpacing),
        child: Column(
          children: [
            const BalanceContainer(),
            ItemSperator.vertical(),
            const AnalyticContainer(),
            ItemSperator.vertical(),
            const ExpensesContainer(),
            ItemSperator.vertical(),
            const RecentTransactionsList(),
            ItemSperator.vertical(),
            const ShareContainer()
          ],
        ),
      ),
    );
  }
}
