import 'package:smartFin/features/onboarding/data/repository/onboarding_repository.dart';
import 'package:smartFin/features/onboarding/domain/entities/onboarding_entity.dart';
import 'package:smartFin/features/onboarding/domain/usecases/usecase.dart';

// Get Onboarding Status
class GetOnboardingStatusUseCase implements OnboardingUseCase<bool> {
  final OnboardingRepositoy repository;

  GetOnboardingStatusUseCase(this.repository);

  @override
  bool call() {
    return repository.getOnBoardingStatus();
  }
}

// Get Onboarding Data
class GetOnboardingDataUseCase implements OnboardingUseCase<List<OnboardingEntity>> {
  final OnboardingRepositoy repository;

  GetOnboardingDataUseCase(this.repository);

  @override
  List<OnboardingEntity> call() {
    final data = repository.getOnboardingData();
    return data.map((e) => e.toEntity()).toList();
  }
}

// Set Onboarding Status
class SetOnboardingStatusUseCase implements OnboardingUseCase<void> {
  final OnboardingRepositoy repository;

  SetOnboardingStatusUseCase(this.repository);

  @override
  void call() {
    repository.setOnBoardingStatus();
  }
}

// Reset Onboarding Status
class ResetOnboardingStatusUseCase implements OnboardingUseCase<void> {
  final OnboardingRepositoy repository;

  ResetOnboardingStatusUseCase(this.repository);

  @override
  void call() {
    repository.resetOnBoardingStatus();
  }
}
