import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/device/device_utility.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/onboarding/presentation/controllers/onboarding_controller.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return Positioned(
      right: MySizes.defaultSpacing,
      bottom: MyDeviceUtils.getBottomNavigationBarHeight(context),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? MyColors.primaryColor : MyColors.dark),
        child: const Icon(
          Iconsax.arrow_right_3,
          color: MyColors.white,
        ),
      ),
    );
  }
}
