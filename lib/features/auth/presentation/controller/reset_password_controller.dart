import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/utils/helpers/network_manager.dart';
import 'package:smartFin/core/utils/popups/full_screen_loader.dart';
import 'package:smartFin/core/utils/popups/loaders.dart';
import 'package:smartFin/features/auth/domain/usecases/user_reset_password.dart';
import 'package:smartFin/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:smartFin/generated/l10n.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get instance => Get.find();

  final UserResetPassword userResetPassword;

  ResetPasswordController({
    required this.userResetPassword,
  });

  final emailController = TextEditingController();
  final local = AppLocalizations.current;
  final resetformKey = GlobalKey<FormState>();

  Future<void> resetPassword() async {
    MyFullScreenLoader.openLoadingDialog(
      local.processingYourRequest,
      MyImages.docerAnimation,
    );

    try {
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        MyLoaders.errorSnackBar(
          title: local.ohSnap,
          message: local.noInternetConnection,
        );
        return;
      }

      final result = await userResetPassword.call(emailController.text.trim());

      result.fold(
        (failure) {
          MyFullScreenLoader.stopLoading();
          MyLoaders.errorSnackBar(
            title: local.ohSnap,
            message: failure.message,
          );
        },
        (success) {
          MyFullScreenLoader.stopLoading();
          Get.off(() => ResetPassword(email: emailController.text.trim()));
          MyLoaders.successSnackBar(
            title: local.emailSentTitle,
            message: local.resetPasswordEmailSentDescription,
          );
          Get.off(() => ResetPassword(email: emailController.text.trim()));
        },
      );
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(
        title: local.ohSnap,
        message: local.somethingWentWrong,
      );
    }
  }

  Future<void> resendResetPasswordEmail() async {
    MyFullScreenLoader.openLoadingDialog(
      local.processingYourRequest,
      MyImages.docerAnimation,
    );

    try {
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        MyLoaders.errorSnackBar(
          title: local.ohSnap,
          message: local.noInternetConnection,
        );
        return;
      }

      final result = await userResetPassword.call(emailController.text.trim());
      result.fold(
        (failure) {
          MyFullScreenLoader.stopLoading();
          MyLoaders.errorSnackBar(
            title: local.ohSnap,
            message: failure.message,
          );
        },
        (success) {
          MyFullScreenLoader.stopLoading();
          MyLoaders.successSnackBar(
            title: local.emailSentTitle,
            message: local.resetPasswordEmailSentDescription,
          );
        },
      );
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.errorSnackBar(
        title: local.ohSnap,
        message: local.somethingWentWrong,
      );
    }
  }
}
