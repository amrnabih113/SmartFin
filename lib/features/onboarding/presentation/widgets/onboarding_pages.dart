import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/features/onboarding/presentation/controllers/onboarding_controller.dart';

class OnBoardingPages extends StatelessWidget {
  OnBoardingPages({super.key});

  final controller = Get.put(OnBoardingController(
      getOnboardingData: sl(),
      getOnboardingStatus: sl(),
      setOnboardingStatus: sl(),
      resetOnboardingStatus: sl()));

  @override
  Widget build(BuildContext context) {
    final onBoardingItems = controller.onBoardingItems;
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: controller.updatePageIndicator,
        itemCount: onBoardingItems.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(MySizes.defaultSpacing),
            child: Column(children: [
              Lottie.asset(
                onBoardingItems[index].image,
                key: ValueKey(onBoardingItems[index].image),
                height: MyHelperFunctions.getScreenHeight() * 0.6,
                width: MyHelperFunctions.getScreenWidth() * 0.8,
              ),
              Text(onBoardingItems[index].title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MySizes.spaceBetweenItems),
              Text(onBoardingItems[index].subtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
            ]),
          );
        });
  }
}
