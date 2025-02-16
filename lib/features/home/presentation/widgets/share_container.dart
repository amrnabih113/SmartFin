
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/widgets/my_filled_button.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/generated/l10n.dart';

class ShareContainer extends StatelessWidget {
  const ShareContainer({
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
              Lottie.asset(
                MyImages.shareAnimation,
              ),
              Text(
                "Shared Budget",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ItemSperator.vertical(),
              Text(
                "Invite your parteners, roommates, or anyone you want to share your budget with.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              ItemSperator.vertical(),
              MyFilledButton(
                text: AppLocalizations.current.inviteAMember,
                icon: Icons.people_alt_outlined,
                onPressed: () {},
              )
            ]));
  }
}
