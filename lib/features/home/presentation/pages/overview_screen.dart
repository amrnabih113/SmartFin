import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/features/home/presentation/controllers/overview_controller.dart';
import 'package:smartFin/features/home/presentation/pages/my_household_screen.dart';
import 'package:smartFin/features/home/presentation/pages/transactions_screen.dart';
import 'package:smartFin/features/home/presentation/widgets/overview_appbar.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OverviewController());
    return Obx(() {
      final selectedIndex = controller.selectedIndex.value;
      return Scaffold(
        appBar: const OverviewAppbar(),
        body: selectedIndex == 0
            ? const MyHouseholdScreen()
            : const TransactionsScreen(),
      );
    });
  }
}
