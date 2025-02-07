import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/sepetarors/section_seperator.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/device/device_utility.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/features/auth/presentation/controller/signin_controller.dart';
import 'package:smartFin/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:smartFin/features/auth/presentation/widgets/myform_divider.dart';
import 'package:smartFin/features/auth/presentation/widgets/remember_me_and_forget_password.dart';
import 'package:smartFin/features/auth/presentation/widgets/signin_form.dart';
import 'package:smartFin/features/auth/presentation/widgets/soical_buttons.dart';
import 'package:smartFin/generated/l10n.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    final signInController = Get.put(SignInController(
      localStorage: sl(),
      userSignInWithEmailAndPassword: sl(),
      userSignInWithGoogle: sl(),
      userSignOut: sl(),
    ));

    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: MyDeviceUtils.getAppBarHeight(),
              left: MySizes.defaultSpacing,
              right: MySizes.defaultSpacing,
              bottom: MySizes.defaultSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                  isDark ? MyImages.appLogoDark : MyImages.appLogoLight),
              Text(
                AppLocalizations.current.signInTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              ItemSperator.halfVertical(),
              Text(
                AppLocalizations.current.signInDescription,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SectionSeperator.vertical(),
              const SigninForm(),
              const RemmberMeAndForgetPassword(),
              ItemSperator.vertical(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () =>
                        signInController.signinWithEmailAndPassword(),
                    child: Text(AppLocalizations.current.signIn)),
              ),
              ItemSperator.vertical(),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignUpScreen()),
                    child: Text(AppLocalizations.current.signUP)),
              ),
              SectionSeperator.vertical(),
              MyFormDivider(deviderText: AppLocalizations.current.orSignInWith),
              SectionSeperator.vertical(),
              const SoicalButtons(),
            ],
          )),
    );
  }
}
