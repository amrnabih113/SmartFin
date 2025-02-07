import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/auth/presentation/controller/reset_password_controller.dart';
import 'package:smartFin/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:smartFin/generated/l10n.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final controller = ResetPasswordController.instance;
    final local = AppLocalizations.current;
    return Scaffold(
      appBar: MyAppBar(
        showBackButton: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.close))
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpacing),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Lottie.asset(
            MyImages.sendEmailAnimation,
            width: MyHelperFunctions.getScreenWidth() * 0.6,
          ),
          const SizedBox(
            height: MySizes.spaceBetweenSections,
          ),
          Text(
            email,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: MySizes.spaceBetweenSections,
          ),
          //title and subtitle
          Text(
            local.changeYourPasswordTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: MySizes.spaceBetweenSections,
          ),
          Text(
            local.changeYourPasswordSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: MySizes.spaceBetweenSections),

          // button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.offAll(() => const SignInScreen()),
                child: Text(local.done)),
          ),
          const SizedBox(
            height: MySizes.spaceBetweenItems,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () => controller.resendResetPasswordEmail(),
                child: Text(
                  local.resendEmail,
                  style: Theme.of(context).textTheme.bodySmall,
                )),
          ),
        ]),
      )),
    );
  }
}
