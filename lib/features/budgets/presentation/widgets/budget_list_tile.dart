
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/widgets/budget_progress_bar.dart';
import 'package:smartFin/common/widgets/category_outlined_icon.dart';

class BudgetListTile extends StatelessWidget {
  final String title;
  final String remaining;
  final double currentAmount;
  final double totalBudget;
  final MaterialColor color;
  final IconData icon;

  const BudgetListTile({
    super.key,
    required this.title,
    required this.remaining,
    required this.currentAmount,
    required this.totalBudget,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = currentAmount / totalBudget;
    final IconData faceSmileIcon;
    final Color faceSmileColor;
    if (currentAmount > totalBudget) {
      faceSmileIcon = FontAwesomeIcons.faceFrown;
      faceSmileColor = Colors.red;
    } else if (progress < 0.5) {
      faceSmileIcon = FontAwesomeIcons.faceSmile;
      faceSmileColor = Colors.green;
    } else if (progress >= 0.5 && progress <= 0.75) {
      faceSmileIcon = FontAwesomeIcons.faceMeh;
      faceSmileColor = Colors.yellow;
    } else {
      faceSmileIcon = FontAwesomeIcons.faceSadTear;
      faceSmileColor = Colors.orange;
    }

    return Row(
      children: [
        CategoryOutlinedIcon(
          color: color,
          icon: icon,
          size: 30,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      if (currentAmount <= totalBudget)
                        Text(
                          "Left: ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      if (currentAmount <= totalBudget)
                        Text(
                          remaining,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      if (currentAmount > totalBudget)
                        const Text(
                          " (Limit Exceeded)",
                          style: TextStyle(color: Colors.red),
                        ),
                      ItemSperator.halfHorizontal(),
                      Icon(
                        faceSmileIcon,
                        size: 15,
                        color: faceSmileColor,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 4),
              Text(
                "\$$currentAmount/\$$totalBudget",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 4),
              BudgetProgressBar(
                currentAmount: currentAmount,
                totalBudget: totalBudget,
                showText: false,
                color: color,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
