import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/utils/helpers/network_manager.dart';
import 'package:smartFin/core/utils/popups/full_screen_loader.dart';
import 'package:smartFin/core/utils/popups/loaders.dart';
import 'package:smartFin/features/auth/domain/entites/signup_data.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_out.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_up.dart';
import 'package:smartFin/features/auth/presentation/pages/verify_email_screen.dart';
import 'package:smartFin/generated/l10n.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final UserSignUp userSignUp;
  final UserSignOut userSignOut;
  final GetStorage localStorage;
  final AppLocalizations local = AppLocalizations.current;

  SignUpController({
    required this.userSignUp,
    required this.userSignOut,
    required this.localStorage,
  });

  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final signupFormKey = GlobalKey<FormState>();

  RxBool hidePassword = true.obs;
  RxBool agreeTerms = false.obs;

  void togglePassword() {
    hidePassword.value = !hidePassword.value;
  }

  Future<void> signup() async {
    if (!signupFormKey.currentState!.validate()) return;
    try {
      MyFullScreenLoader.openLoadingDialog(
          local.signingUp, MyImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        MyLoaders.errorSnackBar(
          title: local.ohSnap,
          message: local.noInternetConnection,
        );
        return;
      }

      if (!agreeTerms.value) {
        MyFullScreenLoader.stopLoading();
        MyLoaders.errorSnackBar(
          title: local.ohSnap,
          message: local.agreeTerms,
        );
        return;
      }

      final SignupData signupData = SignupData(
        firstName: fNameController.text.trim(),
        lastName: lNameController.text.trim(),
        userName: userNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await userSignUp.call(signupData);

      MyFullScreenLoader.stopLoading();
      Get.to(() => VerifyEmailSCreen(email: emailController.text.trim()));
    } catch (e) {
      print("Error: $e");
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(
        title: local.ohSnap,
        message: e.toString(),
      );
    }
  }
}
