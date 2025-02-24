import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smartFin/config/routing/screen_redirect.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/constants/texts.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/core/utils/helpers/network_manager.dart';
import 'package:smartFin/core/utils/popups/full_screen_loader.dart';
import 'package:smartFin/core/utils/popups/loaders.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/features/auth/domain/entites/login_data.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_in_with_email_and_password.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_in_with_google.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_out.dart';
import 'package:smartFin/features/auth/presentation/controller/user_controller.dart';
import 'package:smartFin/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:smartFin/generated/l10n.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();
  final userController = Get.put(UserController(sqfliteAuth: sl()));

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
    signinFormKey = GlobalKey<FormState>();
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

      await userSignInWithEmailAndPassword.call(
        LoginData(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );

      MyFullScreenLoader.stopLoading();
      ScreenRedirect.instance.screenRedirect();
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(
          title: local.ohSnap, message: local.logInFailedTryAgain);
      print("SignIn Error: $e");
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

      await userSignInWithGoogle.call(Void);
      MyFullScreenLoader.stopLoading();
      ScreenRedirect.instance.screenRedirect();
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(
          title: local.ohSnap, message: local.googleSignInFailed);
      print("Google SignIn Error: $e");
    }
  }

  Future<void> signOut() async {
    try {
      Get.defaultDialog(
        contentPadding: const EdgeInsets.all(MySizes.md),
        buttonColor: MyColors.primaryColor,
        title: AppLocalizations.current.loggingOut,
        titlePadding: const EdgeInsets.all(MySizes.md),
        textConfirm: AppLocalizations.current.logOut,
        textCancel: AppLocalizations.current.cancel,
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.white,
        backgroundColor: MyHelperFunctions.isDarkMode(Get.context!)
            ? MyColors.black
            : MyColors.light,
        middleText: AppLocalizations.current.logOutMessage,
        onConfirm: () async {
          await userSignOut.call(Void);
          Get.offAll(() => const SignInScreen());
        },
        onCancel: () => Navigator.of(Get.overlayContext!).pop(),
      );
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(
          title: local.ohSnap, message: local.somethingWentWrong);
      print("SignOut Error: $e");
    }
  }
}
