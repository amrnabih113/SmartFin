import 'package:flutter/material.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text("onBoarding"),
      ),
    );
  }
}
