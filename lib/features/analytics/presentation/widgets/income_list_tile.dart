
import 'package:flutter/material.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/widgets/category_icon_container.dart';

class IncomeListTile extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;
  final MaterialColor color;

  const IncomeListTile({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CategoryIconContainer(color: color, icon: icon),
            ItemSperator.halfHorizontal(),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        Text(
          amount,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
