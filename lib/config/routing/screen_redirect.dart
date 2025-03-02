import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/features/accounts/domain/usecases/get_the_main_account_usecase.dart';
import 'package:smartFin/features/accounts/presentation/pages/set_up_the_cash_screen.dart';
import 'package:smartFin/features/auth/presentation/pages/verify_email_screen.dart';
import 'package:smartFin/navigation_menu.dart';
import 'package:smartFin/core/constants/texts.dart';
import 'package:smartFin/core/local_storage/my_local_storage.dart';
import 'package:smartFin/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:smartFin/features/onboarding/presentation/pages/onboarding_screen.dart';

class ScreenRedirect extends GetxController {
  static ScreenRedirect get instance => Get.find();
  final GetStorage localStorage;
  final firebase = FirebaseAuth.instance;

  ScreenRedirect(this.localStorage);

  @override
  void onReady() async {
    FlutterNativeSplash.remove();
    await screenRedirect(); // Ensure redirection happens after splash is removed
  }

  Future<void> screenRedirect() async {
    User? user = firebase.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        await MyLocalStorage.init(user.uid); // Await initialization
        final account = await GetTheMainAccountUsecase(sl()).execute();
        bool hasDefaultAccount = account == null ? false : true;
        print("=============== hasDefaultAccount: $hasDefaultAccount");

        Get.offAll(() => hasDefaultAccount
            ? const NavigationMenu()
            : const SetBalanceScreen());
      } else {
        Get.offAll(() => VerifyEmailSCreen(email: user.email));
      }
    } else {
      bool isFirstTime = localStorage.read(MyTexts.isFirstTime) ?? true;

      if (isFirstTime) {
        Get.offAll(() => const OnBoardingScreen());
      } else {
        Get.offAll(() => const SignInScreen());
      }
    }
  }
}
