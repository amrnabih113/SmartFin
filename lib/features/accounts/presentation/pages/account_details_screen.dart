import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/formatters/dateformater.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/features/accounts/domain/entites/account_entity.dart';
import 'package:smartFin/features/accounts/presentation/controllers/account_details_controller.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key, required this.account});
  final AccountEntity account;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AccountDetailsController(
      getTransactionsByAccountUsecase: sl(),
      getCategoryByIdUsecase: sl(),
      account: account,
    ));

    return Scaffold(
      appBar: MyAppBar(
        title: Text(account.name),
        isCenter: true,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Balance
            Card(
              color: MyColors.darkContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: InkWell(
                onTap: () => controller.showPasswordDialog(),
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current Balance",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Obx(() => Text(
                            controller.isBalanceVisible.value
                                ? "\$${account.balance.toStringAsFixed(2)}"
                                : "****",
                            style: Theme.of(context).textTheme.headlineLarge,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              final spots = controller.getBalanceSpots();
              final double currentBalance = account.balance;
              final bool isFlatLine = spots.length < 2 ||
                  spots.every((spot) => spot.y == spots.first.y);

              return SizedBox(
                height: 160,
                child: LineChart(
                  LineChartData(
                    minY: 0, // Y-axis starts from 0
                    maxY: spots.isNotEmpty
                        ? spots
                                .map((e) => e.y)
                                .reduce((a, b) => a > b ? a : b) *
                            1.2
                        : currentBalance * 2,
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              '\$${value.toInt()}', // Display as currency
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 24,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              '${value.toInt()}d', // Replace with actual date conversion if needed
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          },
                        ),
                      ),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.grey.withOpacity(0.2),
                        strokeWidth: 1,
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots.isNotEmpty
                            ? spots
                            : [
                                FlSpot(0,
                                    currentBalance), // Constant line at current balance
                                FlSpot(1, currentBalance),
                              ],
                        isCurved: !isFlatLine, // Curved only if values change
                        barWidth: 4,
                        color: Colors.blue,
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.withOpacity(0.3),
                              Colors.transparent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) =>
                              FlDotCirclePainter(
                            radius: 4,
                            color: Colors.blue,
                            strokeWidth: 2,
                            strokeColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),

            // Transactions List
            Text(
              "Recent Transactions",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.transactions.isEmpty) {
                  return Center(
                    child: Text(
                      "No transactions found.",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: controller.transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = controller.transactions[index];
                    final isIncome = transaction.transactionType == "income";
                    final icon =
                        isIncome ? Icons.arrow_upward : Icons.arrow_downward;
                    final iconColor = isIncome ? Colors.green : Colors.red;
                    final sign = isIncome ? "+" : "-";
                    final category = controller.transactionCategories[index];
                    return ListTile(
                      leading: Icon(icon, color: iconColor),
                      title: Text(category.name),
                      subtitle:
                          Text(MyDateFormatter.formatDate(transaction.date)),
                      trailing: Text(
                          "$sign\$${transaction.amount.abs().toStringAsFixed(2)}"),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
