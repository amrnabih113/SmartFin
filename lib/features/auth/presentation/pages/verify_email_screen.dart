import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/features/auth/presentation/controller/verify_email_controller.dart';
import 'package:smartFin/generated/l10n.dart';

class VerifyEmailSCreen extends StatelessWidget {
  const VerifyEmailSCreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController(sl()));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpacing),
        child: Column(children: [
          Lottie.asset(
            MyImages.sendEmailAnimation,
            width: MyHelperFunctions.getScreenWidth() * 0.6,
          ),
          const SizedBox(
            height: MySizes.spaceBetweenSections,
          ),
          Text(
            AppLocalizations.current.confirmEmail,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: MySizes.spaceBetweenItems,
          ),
          Text(
            email ?? " ",
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: MySizes.spaceBetweenSections,
          ),
          Text(
            AppLocalizations.current.confirmEmailSubtitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: MySizes.spaceBetweenSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.checkEmailVerificationStatus(),
                child: Text(AppLocalizations.current.Continue)),
          ),
          const SizedBox(
            height: MySizes.spaceBetweenItems,
          ),
        ]),
      )),
    );
  }
}
