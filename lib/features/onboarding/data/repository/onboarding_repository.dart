import 'package:smartFin/features/onboarding/data/models/onboarding_model.dart';

abstract class OnboardingRepositoy {

  bool getOnBoardingStatus();

  void setOnBoardingStatus();

  void resetOnBoardingStatus();

  List<OnboardingModel> getOnboardingData();
}