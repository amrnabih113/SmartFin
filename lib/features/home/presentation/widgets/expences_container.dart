
import 'package:flutter/material.dart';
import 'package:smartFin/common/charts/pie_chart.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/widgets/my_filled_button.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/generated/l10n.dart';
class ExpencesContainer extends StatelessWidget {
  const ExpencesContainer({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(MySizes.defaultSpacing),
      decoration: BoxDecoration(
          color: isDark ? MyColors.darkContainer : MyColors.light,
          borderRadius: BorderRadius.circular(MySizes.md)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.current.expenses,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ItemSperator.vertical(),
          Center(
              child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Column(
                children: [
                  Text(
                    'Spend This Month',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    '300\$',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              ),
              const MyPieChart(
                sections: [
                  30,
                  60,
                  50,
                  20,
                  80,
                  50,
                  30,
                  60,
                ],
              ),
            ],
          )),
          ItemSperator.vertical(),
          MyFilledButton(
            text: AppLocalizations.current.viewMore,
            icon: Icons.arrow_forward,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}