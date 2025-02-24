import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/core/constants/colors.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/core/utils/popups/full_screen_loader.dart';
import 'package:smartFin/core/utils/popups/loaders.dart';
import 'package:smartFin/features/auth/domain/usecases/user_sign_out.dart';
import 'package:smartFin/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:smartFin/generated/l10n.dart';

class SignoutController extends GetxController {
  static SignoutController get instance => Get.find();
  final UserSignOut userSignOut;

  SignoutController({required this.userSignOut});

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
            ? MyColors.dark
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
          title: AppLocalizations.current.ohSnap,
          message: AppLocalizations.current.somethingWentWrong);
    }
  }
}
