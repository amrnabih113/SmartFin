
import 'package:flutter/material.dart';
import 'package:smartFin/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:smartFin/features/onboarding/presentation/widgets/onboarding_indicator.dart';
import 'package:smartFin/features/onboarding/presentation/widgets/onboarding_pages.dart';
import 'package:smartFin/features/onboarding/presentation/widgets/onboarding_skip_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        OnBoardingPages(),
        const OnBoardingSkipButton(),
        const OnBoardingIndicator(),
        const OnBoardingButton(),
      ],
    ));
  }
}
