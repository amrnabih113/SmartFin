import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/device/device_utility.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showBackButton;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final double padding;
  final bool isCenter;
  final Widget? leadingWidget;

  const MyAppBar(
      {super.key,
      this.title,
      this.showBackButton = false,
      this.leadingIcon,
      this.actions,
      this.leadingWidget,
      this.leadingOnPressed,
      this.padding = MySizes.md,
      this.isCenter = true});
  @override
  Widget build(BuildContext context) {
    //final settingsController = SettingsController.instance;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: leadingWidget ??
            (showBackButton
                ? IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      // settingsController.language.value == 'ar'
                      //     ? Iconsax.arrow_right_3
                      //     :
                      Iconsax.arrow_left_2,
                      size: MySizes.iconLg,
                      color: Theme.of(context).iconTheme.color,
                    ))
                : leadingIcon == null
                    ? null
                    : IconButton(
                        onPressed: leadingOnPressed,
                        icon: Icon(
                          leadingIcon,
                          color: Theme.of(context).iconTheme.color,
                          size: MySizes.iconMd,
                        ))),
        title: title,
        actions: actions,
        centerTitle: isCenter,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MyDeviceUtils.getAppBarHeight());
}
