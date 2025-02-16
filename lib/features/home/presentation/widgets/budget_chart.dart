import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/colors.dart';

class BudgetChart extends StatelessWidget {
  final double income;
  final double expenses;
  final double left;

  const BudgetChart({
    super.key,
    required this.income,
    required this.expenses,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    final double maxValue =
        [income, expenses, left].reduce((a, b) => a > b ? a : b) * 1.2;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 220,
            child: BarChart(
              BarChartData(
                barGroups: _buildBarGroups(maxValue),
                titlesData: _buildTitles(context),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: true, drawVerticalLine: false),
                barTouchData: BarTouchData(enabled: false),
                maxY: maxValue,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _buildBarGroups(double maxValue) {
    return [
      _barGroup(0, income, maxValue, Colors.green),
      _barGroup(1, expenses, maxValue, Colors.red),
      _barGroup(2, left, maxValue, Colors.yellow),
    ];
  }

  BarChartGroupData _barGroup(
      int x, double value, double maxValue, MaterialColor color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value.clamp(0, maxValue),
          width: 35,
          borderRadius: BorderRadius.circular(12),
          gradient: MyColors.customGradient(color),
        ),
      ],
    );
  }

  FlTitlesData _buildTitles(BuildContext context) {
    return FlTitlesData(
      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            switch (value.toInt()) {
              case 0:
                return _bottomTitle("\$${income.toInt()}", "Income", context);
              case 1:
                return _bottomTitle(
                    "\$${expenses.toInt()}", "Expenses", context);
              case 2:
                return _bottomTitle("\$${left.toInt()}", "Left", context);
              default:
                return Container();
            }
          },
          reservedSize: 32,
        ),
      ),
    );
  }

  Widget _bottomTitle(String amount, String label, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          amount,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 11),
        ),
      ],
    );
  }
}
