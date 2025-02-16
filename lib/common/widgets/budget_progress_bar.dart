import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/colors.dart';

class BudgetProgressBar extends StatelessWidget {
  final double currentAmount;
  final double totalBudget;
  final bool showText;
  final MaterialColor color;

  const BudgetProgressBar({
    super.key,
    required this.currentAmount,
    required this.totalBudget,
    this.showText = true,
    this.color = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentAmount / totalBudget;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  height: 8,
                  width: constraints.maxWidth * progress,
                  decoration: BoxDecoration(
                    gradient: MyColors.customGradient(color),
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 5),
        Visibility(
          visible: showText,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${currentAmount.toStringAsFixed(0)} / ${(progress * 100).toStringAsFixed(0)}%",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$ ${totalBudget.toStringAsFixed(0)}",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
