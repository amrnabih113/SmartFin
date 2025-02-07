import 'package:flutter/material.dart';
import 'package:smartFin/common/sepetarors/section_seperator.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/features/auth/presentation/controller/signin_controller.dart';
import 'package:smartFin/features/auth/presentation/widgets/social_container.dart';

class SoicalButtons extends StatelessWidget {
  const SoicalButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final signInController = SignInController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialContainer(
            height: 50,
            width: 50,
            child: Image.asset(MyImages.googleLogo),
            onTap: () => signInController.signInWithGoogle()),
        SectionSeperator.horizontal(),
        SocialContainer(
            height: 50, width: 50, child: Image.asset(MyImages.facebookLogo)),
      ],
    );
  }
}
