import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/styles/gradiant_icon.dart';
import 'package:smartFin/common/styles/gradiant_outlined_button.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/common/widgets/mysection_heading.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/features/categories/presentation/pages/categories_screen.dart';
import 'package:smartFin/features/settings/presentation/controllers/signout_controller.dart';
import 'package:smartFin/features/settings/presentation/widgets/profile_tile.dart';
import 'package:smartFin/features/settings/presentation/widgets/setting_menu_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sigoutController = Get.put(SignoutController(userSignOut: sl()));
    return Scaffold(
      appBar: MyAppBar(
        showBackButton: true,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(MySizes.defaultSpacing),
            child: Column(
              children: [
                const ProfileTile(),
                ItemSperator.vertical(),
                const Divider(
                  indent: 15,
                  endIndent: 15,
                ),
                ItemSperator.vertical(),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    /// 🔹 FEATURES SECTION
                    const MySectionHeading(
                      title: "Account Features",
                      showActionButton: false,
                    ),
                    Column(
                      children: [
                        MySettingsMenuTile(
                          icon: const GradientIcon(
                              icon: HugeIcons.strokeRoundedUserGroup, size: 25),
                          title: 'Accounts',
                          subtitle: "Manage your accounts",
                          trailing: const Icon(Iconsax.arrow_right_3),
                          onTap: () {},
                        ),
                        MySettingsMenuTile(
                          icon: const GradientIcon(
                              icon: Iconsax.category, size: 25),
                          title: 'Categories',
                          subtitle: "Edit and organize categories",
                          trailing: const Icon(Iconsax.arrow_right_3),
                          onTap: () => Get.to(() => const CategoriesScreen()),
                        ),
                        MySettingsMenuTile(
                          icon: const GradientIcon(
                              icon: HugeIcons.strokeRoundedTarget01, size: 25),
                          title: 'Financial Goals',
                          subtitle: "Track your savings goals",
                          trailing: const Icon(Iconsax.arrow_right_3),
                          onTap: () {
                            // Navigate to financial goals
                          },
                        ),
                        MySettingsMenuTile(
                          icon: const GradientIcon(
                              icon: Iconsax.repeat, size: 25),
                          title: 'Recurring Transactions',
                          subtitle: "Manage automatic payments",
                          trailing: const Icon(Iconsax.arrow_right_3),
                          onTap: () {
                            // Navigate to recurring transactions
                          },
                        ),
                      ],
                    ),
                    ItemSperator.vertical(),
                    const MySectionHeading(
                        title: "App Settings", showActionButton: false),
                    Column(
                      children: [
                        MySettingsMenuTile(
                          icon: const GradientIcon(
                              icon: Iconsax.global, size: 25),
                          title: 'Currency & Preferences',
                          subtitle: "Set default currency & language",
                          trailing: const Icon(Iconsax.arrow_right_3),
                          onTap: () {
                            // Navigate to currency settings
                          },
                        ),
                        MySettingsMenuTile(
                          icon: const GradientIcon(
                              icon: Iconsax.shield_tick, size: 25),
                          title: 'Security & Privacy',
                          subtitle: "Set up PIN, Face ID, or fingerprint",
                          trailing: const Icon(Iconsax.arrow_right_3),
                          onTap: () {
                            // Navigate to security settings
                          },
                        ),
                        MySettingsMenuTile(
                          icon:
                              const GradientIcon(icon: Iconsax.cloud, size: 25),
                          title: 'Backup & Restore',
                          subtitle: "Sync or restore your data",
                          trailing: const Icon(Iconsax.arrow_right_3),
                          onTap: () {
                            // Navigate to backup settings
                          },
                        ),
                        MySettingsMenuTile(
                          icon:
                              const GradientIcon(icon: Iconsax.sun_1, size: 25),
                          title: 'Theme & Appearance',
                          subtitle: "Switch between light & dark mode",
                          trailing: const Icon(Iconsax.arrow_right_3),
                          onTap: () {
                            // Navigate to theme settings
                          },
                        ),
                        MySettingsMenuTile(
                          icon: const GradientIcon(
                              icon: Iconsax.info_circle, size: 25),
                          title: 'About & Support',
                          subtitle: "Help, FAQs, and app info",
                          trailing: const Icon(Iconsax.arrow_right_3),
                          onTap: () {
                            // Navigate to about & support
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                ItemSperator.vertical(),
                SizedBox(
                    width: double.infinity,
                    child: GradientOutlinedButton(
                        onPressed: () => sigoutController.signOut(),
                        child: const Text("Sign Out"))),
              ],
            )),
      ),
    );
  }
}
