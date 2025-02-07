import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/sepetarors/section_seperator.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/validators/validation.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/features/auth/presentation/controller/reset_password_controller.dart';
import 'package:smartFin/generated/l10n.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.current;
    final resetformKey = GlobalKey<FormState>();
    final ResetPasswordController controller =
        Get.put(ResetPasswordController(userResetPassword: sl()));
    return Scaffold(
      appBar: MyAppBar(
        showBackButton: true,
        title: Text(local.resetPassword,
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpacing),
          child: Form(
            key: resetformKey,
            child: Column(children: [
              Text(local.forgetPasswordTitle,
                  style: Theme.of(context).textTheme.headlineLarge),
              ItemSperator.vertical(),
              Text(local.forgetPasswordDescription,
                  style: Theme.of(context).textTheme.bodyLarge),
              SectionSeperator.doubleVertical(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: local.email,
                  prefixIcon: const Icon(HugeIcons.strokeRoundedMail01),
                ),
                controller: controller.emailController,
                validator: (value) => MyValidator.validateEmail(value),
              ),
              ItemSperator.doubleVertical(),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (resetformKey.currentState!.validate()) {
                        controller.resetPassword();
                      }
                    },
                    child: Text(local.submit),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
