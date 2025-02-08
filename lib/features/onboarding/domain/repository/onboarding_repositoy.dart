import 'package:get_storage/get_storage.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/constants/texts.dart';
import 'package:smartFin/features/onboarding/data/models/onboarding_model.dart';
import 'package:smartFin/features/onboarding/data/repository/onboarding_repository.dart';
import 'package:smartFin/generated/l10n.dart';

class OnboardingRepositoyimpl implements OnboardingRepositoy {
  final GetStorage storage;
  OnboardingRepositoyimpl({
    required this.storage,
  });

  @override
  bool getOnBoardingStatus() {
    return storage.read<bool>(MyTexts.isFirstTime) ?? true;
  }

  @override
  List<OnboardingModel> getOnboardingData() {
    return [
      OnboardingModel(
        image: MyImages.onboarding1,
        title: AppLocalizations.current.onboardingTitle1,
        subtitle: AppLocalizations.current.onboardingSubtitle1,
      ),
      OnboardingModel(
        image: MyImages.onboarding2,
        title: AppLocalizations.current.onboardingTitle2,
        subtitle: AppLocalizations.current.onboardingSubtitle2,
      ),
      OnboardingModel(
        image: MyImages.onboarding3,
        title: AppLocalizations.current.onboardingTitle3,
        subtitle: AppLocalizations.current.onboardingSubtitle3,
      )
    ];
  }

  @override
  void resetOnBoardingStatus() {
    storage.write(MyTexts.isFirstTime, true);
  }

  @override
  void setOnBoardingStatus() {
    storage.write(MyTexts.isFirstTime, false);
  }
}
