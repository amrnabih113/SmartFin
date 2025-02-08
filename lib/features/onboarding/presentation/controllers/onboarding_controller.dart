import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:smartFin/features/onboarding/domain/entities/onboarding_entity.dart';
import 'package:smartFin/features/onboarding/domain/usecases/onboarding_usecases.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final GetOnboardingStatusUseCase getOnboardingStatus;
  final GetOnboardingDataUseCase getOnboardingData;
  final SetOnboardingStatusUseCase setOnboardingStatus;
  final ResetOnboardingStatusUseCase resetOnboardingStatus;

  OnBoardingController({
    required this.getOnboardingStatus,
    required this.getOnboardingData,
    required this.setOnboardingStatus,
    required this.resetOnboardingStatus,
  });

  late List<OnboardingEntity> onBoardingItems;
  @override
  void onInit() {
    onBoardingItems = getOnboardingData.call();
    super.onInit();
  }

  //variables
  final pageController = PageController();
  final currentIndex = 0.obs;

  // update current index
  void updatePageIndicator(int index) => currentIndex.value = index;

  //jumb to the specified page
  void dotNavigationClick(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(currentIndex.value);
  }

  //jump to the next page
  void nextPage() {
    if (currentIndex.value == 2) {
      print("=================making not first time user");
      setOnboardingStatus.call();
      print("===============${getOnboardingStatus.call()}");

      Get.to(() => const SignInScreen());
    }
    currentIndex.value = currentIndex.value + 1;
    pageController.jumpToPage(currentIndex.value);
  }

  //jumb to last page
  void skipPage() {
    currentIndex.value = 2;
    pageController.jumpToPage(currentIndex.value);
  }
}
