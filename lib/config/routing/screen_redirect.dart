import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smartFin/features/auth/presentation/pages/verify_email_screen.dart';
import 'package:smartFin/navigation_menu.dart';
import 'package:smartFin/core/constants/texts.dart';
import 'package:smartFin/core/local_storage/my_local_storage.dart';
import 'package:smartFin/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:smartFin/features/onboarding/presentation/pages/onboarding_screen.dart';

class ScreenRedirect extends GetxController {
  static ScreenRedirect get instance => Get.find();
  final GetStorage localStorage;

  ScreenRedirect(
    this.localStorage,
  );
  final firebase = FirebaseAuth.instance;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    User? user = firebase.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        await MyLocalStorage.init(user.uid);
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailSCreen(
              email: user.email,
            ));
      }
    } else {
      localStorage.writeIfNull(MyTexts.isFirstTime, true);
      localStorage.read(MyTexts.isFirstTime) != true
          ? Get.offAll(() => const SignInScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }
}
