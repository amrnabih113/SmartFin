import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/sepetarors/section_seperator.dart';
import 'package:smartFin/common/styles/gradiant_elevation_butoon.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/popups/loaders.dart';
import 'package:smartFin/features/transactions/presentation/controllers/calculator_conreoller.dart';
import 'package:smartFin/features/transactions/presentation/pages/transaction_info_screen.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CalculatorController controller = Get.put(CalculatorController());

    return Scaffold(
      appBar: const MyAppBar(
        title: Text("New transaction"),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpacing),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - kToolbarHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Align(
                      alignment: Alignment.center,
                      child: Text(
                        "\$${controller.amount.value}",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    )),
                SectionSeperator.doubleVertical(),
                Obx(() => ToggleButtons(
                      constraints: const BoxConstraints(minHeight: 40),
                      borderRadius: BorderRadius.circular(20),
                      fillColor: MyColors.selectedButton,
                      selectedColor: Colors.white,
                      color: Colors.grey,
                      isSelected: [
                        controller.selectedCategory.value == "expense",
                        controller.selectedCategory.value == "income",
                        controller.selectedCategory.value == "transfer",
                      ],
                      onPressed: (index) {
                        if (index == 0) {
                          controller.selectedCategory.value = "expense";
                        } else if (index == 1) {
                          controller.selectedCategory.value = "income";
                        } else if (index == 2) {
                          controller.selectedCategory.value = "transfer";
                        }
                      },
                      children: const [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Expense")),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Income")),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Transfer")),
                      ],
                    )),
                SectionSeperator.doubleVertical(),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: 16,
                  itemBuilder: (context, index) {
                    List<String> keys = [
                      "1",
                      "2",
                      "3",
                      "+",
                      "4",
                      "5",
                      "6",
                      "-",
                      "7",
                      "8",
                      "9",
                      "*",
                      ".",
                      "0",
                      "⌫",
                      "/"
                    ];
                    return GestureDetector(
                      onTap: () => controller.onKeyTap(keys[index]),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: MyColors.buttonDark,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          keys[index],
                          style: const TextStyle(
                              fontSize: 24, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () => controller.calculateResult(),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 60,
                          decoration: BoxDecoration(
                            color: MyColors.buttonDark,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "=",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.onKeyTap("AC"),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 60,
                          decoration: BoxDecoration(
                            color: MyColors.buttonDark,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "AC",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ItemSperator.vertical(),
                SizedBox(
                  width: double.infinity,
                  child: GradientElevatedButton(
                    onPressed: () => {
                      if (controller.amount.value != '0')
                        {Get.to(() => const TransactionInfo())}
                      else
                        MyLoaders.warningSnackBar(
                            title: "Warning",
                            message:
                                "The Transaction amount is zero, Please enter an amount."),
                    },
                    child: Text(
                      "Next",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: MyColors.dark),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
