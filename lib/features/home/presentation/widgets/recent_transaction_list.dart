import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/widgets/my_filled_button.dart';
import 'package:smartFin/common/widgets/mysection_heading.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/utils/formatters/dateformater.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/home/presentation/controllers/my_household_controller.dart';
import 'package:smartFin/features/home/presentation/widgets/transaction_list_tile.dart';
import 'package:smartFin/generated/l10n.dart';

class RecentTransactionsList extends StatelessWidget {
  const RecentTransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MyHouseholdController.instance;
    final isDark = MyHelperFunctions.isDarkMode(context);

    return Obx(() {
      if (controller.recentTransactions.isEmpty) {
        return const SizedBox.shrink(); // Hide if no transactions
      }

      final recentTransactionDate = controller.recentTransactions.first.date;

      final String title = MyDateFormatter.isToday(recentTransactionDate)
          ? "Today"
          : (MyDateFormatter.isYesterday(recentTransactionDate)
              ? "Yesterday"
              : MyDateFormatter.dateStringDayMonthYear(recentTransactionDate));

      return Column(
        children: [
          MySectionHeading(
            title: AppLocalizations.current.recentTransactions,
            showActionButton: true,
          ),
          ItemSperator.halfVertical(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "\$${controller.recentTransactions.fold<double>(0, (sum, tx) => sum + tx.amount).toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
          ItemSperator.halfVertical(),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.recentTransactions.length,
            separatorBuilder: (_, __) => ItemSperator.halfVertical(),
            itemBuilder: (context, index) {
              final transaction = controller.recentTransactions[index];

              // Find the matching category for the transaction
              final category = controller.recentTransactionsCategories
                  .firstWhereOrNull((cat) => cat.id == transaction.categoryId);

              return TransactionListTile(
                icon: category?.iconData ?? Icons.category,
                color: category?.materialColor ?? Colors.grey,
                title: category?.name ?? "Unknown",
                subtitle: MyDateFormatter.convert24HourTimeTo12HourTimeWithDay(
                    transaction.date,
                    MyDateFormatter.isToday(transaction.date)),
                trailing: "\$${transaction.amount.toStringAsFixed(2)}",
              );
            },
          ),
          ItemSperator.halfVertical(),
          MyFilledButton(
            text: AppLocalizations.current.viewMore,
            icon: Icons.arrow_forward,
            onPressed: () {},
          ),
        ],
      );
    });
  }
}
