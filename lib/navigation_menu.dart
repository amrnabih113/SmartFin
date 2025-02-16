import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/common/styles/gradiant_fab.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/analytics/presentation/pages/analytics_screen.dart';
import 'package:smartFin/features/budgets/presentation/pages/budgets_screen.dart';
import 'package:smartFin/features/expenses/presentation/pages/expences_screen.dart';
import 'package:smartFin/features/transactions/presentation/pages/calculator_screen.dart';
import 'package:smartFin/features/home/presentation/pages/overview_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());
    // Get.put(AddressesController());

    return Scaffold(
        floatingActionButton: GradientFAB(
            onPressed: () => Get.to(() => const CalculatorScreen())),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: Obx(
          () => ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(30),
            child: BottomAppBar(
              color: dark ? MyColors.darker : MyColors.light,
              shape: const CircularNotchedRectangle(),
              notchMargin: 10.0,
              height: 80,
              clipBehavior: Clip.antiAlias,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Iconsax.home,
                        color: controller.selectedIndex.value == 0
                            ? MyColors.primaryColor
                            : Colors.grey),
                    onPressed: () => controller.selectedIndex.value = 0,
                  ),
                  IconButton(
                    icon: Icon(HugeIcons.strokeRoundedWallet02,
                        color: controller.selectedIndex.value == 1
                            ? MyColors.primaryColor
                            : Colors.grey),
                    onPressed: () => controller.selectedIndex.value = 1,
                  ),
                  IconButton(
                    icon: Icon(HugeIcons.strokeRoundedActivity03,
                        color: controller.selectedIndex.value == 2
                            ? MyColors.primaryColor
                            : Colors.grey),
                    onPressed: () => controller.selectedIndex.value = 2,
                  ),
                  IconButton(
                    icon: Icon(HugeIcons.strokeRoundedPieChart,
                        color: controller.selectedIndex.value == 3
                            ? MyColors.primaryColor
                            : Colors.grey),
                    onPressed: () => controller.selectedIndex.value = 3,
                  ),
                  // IconButton(
                  //   icon: Icon(Iconsax.category,
                  //       color: controller.selectedIndex.value == 4
                  //           ? MyColors.primaryColor
                  //           : Colors.grey),
                  //   onPressed: () => controller.selectedIndex.value = 4,
                  // ),
                ],
              ),
            ),
          ),
        ),
        body: Obx(
          () => controller.screens[controller.selectedIndex.value],
        ));
  }
}

class NavigationController extends GetxController {
  static final NavigationController instance = Get.find();
  final selectedIndex = 0.obs;

  @override
  void onInit() {
    selectedIndex.value = 0;
    super.onInit();
  }

  final List<Widget> screens = [
    const OverviewScreen(),
    const BudgetsScreen(),
    const AnalyticsScreen(),
    const ExpencesScreen(),
    // const CategoriesScreen()
  ];
}
