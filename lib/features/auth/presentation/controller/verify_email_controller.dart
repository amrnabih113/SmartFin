import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smartFin/config/routing/screen_redirect.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/features/auth/presentation/pages/sucssess_screen.dart';
import 'package:smartFin/generated/l10n.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  final FirebaseAuth _firebaseAuth;

  VerifyEmailController(this._firebaseAuth);

  User? get user => _firebaseAuth.currentUser;
  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    setTimerForAutoRedirect();
  }

  checkEmailVerificationStatus() async {
    await user?.reload();
    if (user != null && !user!.emailVerified) {
      Get.off(() => SuccessScreen(
            image: MyImages.verifyEmailAnimation,
            title: AppLocalizations.current.yourAccountCreatedTitle,
            subtitle: AppLocalizations.current.yourAccountCreatedSubTitle,
            onPressed: () => ScreenRedirect.instance.screenRedirect(),
          ));
    }
  }
  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: MyImages.verifyEmailAnimation,
            title: AppLocalizations.current.yourAccountCreatedTitle,
            subtitle: AppLocalizations.current.yourAccountCreatedSubTitle,
            onPressed: () => ScreenRedirect.instance.screenRedirect(),
            ));
      }
    });
  }
  checkEmailVerifcationStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && user.emailVerified) {
      Get.off(() => SuccessScreen(image:
            MyImages.verifyEmailAnimation,
            title: AppLocalizations.current.yourAccountCreatedTitle,
            subtitle: AppLocalizations.current.yourAccountCreatedSubTitle,
            onPressed: () => ScreenRedirect.instance.screenRedirect(),
          ));
    }
  }
}
