import 'package:flutter/material.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/generated/l10n.dart';

class SignupTermsCheckbox extends StatelessWidget {
  const SignupTermsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(children: [
      const SizedBox(
        width: MySizes.sm,
        child: Checkbox(value: true, onChanged: null),
      ),
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
