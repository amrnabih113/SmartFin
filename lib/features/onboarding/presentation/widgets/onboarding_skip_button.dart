
import 'package:flutter/material.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/device/device_utility.dart';
import 'package:smartFin/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:smartFin/generated/l10n.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MyDeviceUtils.getAppBarHeight(),
        right: MySizes.defaultSpacing,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: Text(AppLocalizations.current.skip, style: Theme.of(context).textTheme.bodyMedium),
        ));
  }
}
