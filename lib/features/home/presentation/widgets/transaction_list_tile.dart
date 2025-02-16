
import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.icon,
  });

  final MaterialColor color;
  final String title;
  final String subtitle;
  final String trailing;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return ListTile(
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(MySizes.xl)),
      tileColor: isDark ? MyColors.darkContainer : MyColors.light,
      minTileHeight: 80,
      leading: Container(
        padding: const EdgeInsets.all(MySizes.md),
        decoration: BoxDecoration(
            gradient: MyColors.customGradient(color), shape: BoxShape.circle),
        child: Icon(
          icon,
          color: MyColors.white,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelLarge!,
      ),
      trailing: Text(
        trailing,
        style: Theme.of(context).textTheme.bodyLarge!,
      ),
    );
  }
}
