import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/features/auth/presentation/controller/signup_controller.dart';
import 'package:smartFin/generated/l10n.dart';

class SignupTermsCheckbox extends StatelessWidget {
  const SignupTermsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpController = SignUpcontroller.instance;
    return Row(children: [
      Obx(() {
        final isChecked = signUpController.agreeTerms.value;
        return Checkbox(
          value: isChecked,
          onChanged: (value) {
            signUpController.agreeTerms.value = value ?? false;
          },
        );
      }),
      ItemSperator.halfHorizontal(),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${AppLocalizations.current.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextSpan(
                text: AppLocalizations.current.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium?.apply(
                    decoration: TextDecoration.underline,
                    color: MyColors.primaryColor,
                    decorationColor: MyColors.primaryColor)),
            TextSpan(
              text: ' ${AppLocalizations.current.and} ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextSpan(
                text: AppLocalizations.current.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium?.apply(
                    decoration: TextDecoration.underline,
                    color: MyColors.primaryColor,
                    decorationColor: MyColors.primaryColor)),
          ],
        ),
      )
    ]);
  }
}
