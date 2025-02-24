// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';

import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/styles/gradiant_icon.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/device/device_utility.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/home/presentation/controllers/overview_controller.dart';
import 'package:smartFin/features/settings/presentation/pages/setting_screen.dart';
import 'package:smartFin/generated/l10n.dart';

class OverviewAppbar extends StatelessWidget implements PreferredSizeWidget {
  const OverviewAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OverviewController controller = Get.put(OverviewController());
    final isDark = MyHelperFunctions.isDarkMode(context);

    return MyAppBar(
      leadingWidget: IconButton(
        icon: Icon(
          HugeIcons.strokeRoundedSearch02,
          size: MySizes.iconMd,
          color: isDark ? MyColors.white : MyColors.dark,
        ),
        onPressed: () {},
      ),
      isCenter: true,
      title: Row(
        children: [
          Text(
            "${AppLocalizations.current.overView}  ",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          Obx(
            () => Text(
              controller.selectedIndex.value == 0
                  ? "My Household"
                  : "Transcations",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          PopupMenuButton<String>(
            color: isDark ? MyColors.dark : MyColors.white,
            borderRadius: BorderRadius.circular(MySizes.lg),
            offset: const Offset(0, 40),
            padding: const EdgeInsets.all(MySizes.sm),
            onSelected: (value) =>
                controller.selectedIndex.value = int.parse(value),
            icon: Icon(
              Iconsax.arrow_down_1,
              size: MySizes.iconMd,
              color: isDark ? MyColors.white : MyColors.dark,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0.toString(),
                child: Row(
                  children: [
                    const GradientIcon(
                      icon: Icons.dashboard_outlined,
                      gradient: MyColors.primaryGradient,
                      size: MySizes.iconMd,
                    ),
                    ItemSperator.halfHorizontal(),
                    Text("My Household",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1.toString(),
                child: Row(
                  children: [
                    const GradientIcon(
                      icon: Icons.swap_horiz,
                      gradient: MyColors.primaryGradient,
                      size: MySizes.iconMd,
                    ),
                    ItemSperator.halfHorizontal(),
                    Text("Transcations",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () => Get.to(() => const SettingScreen()),
            icon: const Icon(HugeIcons.strokeRoundedSettings01))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MyDeviceUtils.getAppBarHeight());
}
