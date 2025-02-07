import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/features/auth/presentation/controller/signin_controller.dart';
import 'package:smartFin/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:smartFin/generated/l10n.dart';

class RemmberMeAndForgetPassword extends StatelessWidget {
  const RemmberMeAndForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signInController = SignInController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Obx(() => Checkbox(
                  value: signInController.rememberMe.value,
                  onChanged: (value) {
                    signInController.rememberMe.value = value ?? false;
                  },
                )),
            Text(AppLocalizations.current.rememberMe)
          ],
        ),
        InkWell(
          onTap: () => Get.to(() => const ForgetPasswordScreen()),
          child: Text(AppLocalizations.current.ForgetPassword),
        )
      ],
    );
  }
}
