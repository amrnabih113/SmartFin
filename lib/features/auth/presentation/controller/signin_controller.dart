import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smartFin/config/routing/screen_redirect.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/constants/texts.dart';
import 'package:smartFin/core/utils/helpers/network_manager.dart';
import 'package:smartFin/core/utils/popups/full_screen_loader.dart';
import 'package:smartFin/core/utils/popups/loaders.dart';
import 'package:smartFin/features/auth/domain/entites/login_data.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_in_with_email_and_password.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_in_with_google.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_out.dart';
import 'package:smartFin/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:smartFin/generated/l10n.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final GetStorage localStorage;
  final UserSignInWithEmailAndPassword userSignInWithEmailAndPassword;
  final UserSignInWithGoogle userSignInWithGoogle;
  final UserSignOut userSignOut;

  SignInController({
    required this.localStorage,
    required this.userSignInWithEmailAndPassword,
    required this.userSignInWithGoogle,
    required this.userSignOut,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late GlobalKey<FormState> signinFormKey;
  final RxBool isLoading = false.obs;
  final RxBool hidePassword = true.obs;
  final RxBool rememberMe = false.obs;

  final AppLocalizations local = AppLocalizations.current;

  @override
  void onInit() {
    emailController.text = localStorage.read(MyTexts.rememberMeEmail) ?? "";
    passwordController.text =
        localStorage.read(MyTexts.rememberMePassword) ?? "";
    super.onInit();
  }

  void togglePassword() {
    hidePassword.value = !hidePassword.value;
    update();
  }

  Future<void> signinWithEmailAndPassword() async {
    if (!signinFormKey.currentState!.validate()) return;

    try {
      MyFullScreenLoader.openLoadingDialog(
          local.loggingIn, MyImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        MyLoaders.errorSnackBar(
            title: local.ohSnap, message: local.noInternetConnection);
        return;
      }

      if (rememberMe.value) {
        localStorage.write(
            MyTexts.rememberMeEmail, emailController.text.trim());
        localStorage.write(
            MyTexts.rememberMePassword, passwordController.text.trim());
      } else {
        localStorage.remove(MyTexts.rememberMeEmail);
        localStorage.remove(MyTexts.rememberMePassword);
      }

      final result = await userSignInWithEmailAndPassword.call(
        LoginData(
            email: emailController.text.trim(),
            password: passwordController.text.trim()),
      );

      result.fold(
        (failure) {
          MyFullScreenLoader.stopLoading();
          MyLoaders.errorSnackBar(
              title: local.ohSnap, message: failure.message);
        },
        (success) {
          MyFullScreenLoader.stopLoading();
          ScreenRedirect.instance.screenRedirect();
        },
      );
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(
          title: local.ohSnap, message: local.logInFailedTryAgain);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      MyFullScreenLoader.openLoadingDialog(
          local.loggingIn, MyImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        MyLoaders.errorSnackBar(
            title: local.ohSnap, message: local.noInternetConnection);
        return;
      }
      final result = await userSignInWithGoogle(Void);

      result.fold(
        (failure) {
          MyFullScreenLoader.stopLoading();
          MyLoaders.errorSnackBar(
              title: local.ohSnap, message: failure.message);
        },
        (success) {
          MyFullScreenLoader.stopLoading();
          ScreenRedirect.instance.screenRedirect();
        },
      );
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(
          title: local.ohSnap, message: local.googleSignInFailed);
    }
  }

  Future<void> signOut() async {
    try {
      await userSignOut.call(Void);
      Get.offAll(() => const SignInScreen());
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(
          title: local.ohSnap, message: local.somethingWentWrong);
    }
  }
}
