import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/sepetarors/section_seperator.dart';
import 'package:smartFin/common/styles/gradiant_elevation_butoon.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/validators/validation.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/features/accounts/presentation/controllers/accounts_controller.dart';

class SetBalanceScreen extends StatelessWidget {
  const SetBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
        AccountsController(addAccountUsecase: sl(), fetchAccountsUsecase: sl()),
        permanent: true); // Keep controller alive

    // Keypad values
    final List<String> keys = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "AC",
      "0",
      "⌫"
    ];

    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpacing),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Enter Your Initial Balance",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SectionSeperator.doubleVertical(),
                Obx(() => Text(
                      "\$${controller.cashAmount.value}",
                      style: Theme.of(context).textTheme.headlineLarge,
                    )),
                SectionSeperator.doubleVertical(),
                // Password Field
                Obx(
                  () => TextFormField(
                    cursorColor: MyColors.primaryColor,
                    validator: (value) => MyValidator.validatePassword(value),
                    controller: controller.passwordController,
                    obscureText: !controller.showPassword.value,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () => controller.showPassword.value =
                              !controller.showPassword.value,
                          icon: controller.showPassword.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                      prefixIcon: const Icon(Icons.lock),
                      labelText: "Balance Password",
                    ),
                  ),
                ),

                SectionSeperator.doubleVertical(),
                // Keypad
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: keys.length,
                  itemBuilder: (context, index) {
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
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                ItemSperator.vertical(),
                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: GradientElevatedButton(
                    onPressed: () {
                      controller.setTheCashAccount();
                    },
                    child: Text(
                      "Save Balance",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: MyColors.dark),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
