import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/sepetarors/section_seperator.dart';
import 'package:smartFin/common/widgets/my_app_bar.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/device/device_utility.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/features/auth/presentation/controller/signup_controller.dart';
import 'package:smartFin/features/auth/presentation/widgets/myform_divider.dart';
import 'package:smartFin/features/auth/presentation/widgets/signup_form.dart';
import 'package:smartFin/features/auth/presentation/widgets/signup_terms_checkbox.dart';
import 'package:smartFin/features/auth/presentation/widgets/soical_buttons.dart';
import 'package:smartFin/generated/l10n.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignUpcontroller(
        userSignUp: sl(), userSignOut: sl(), lcocalStorage: sl()));
    return Scaffold(
      appBar: const MyAppBar(
        showBackButton: true,
      ),
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
              Text(
                AppLocalizations.current.signupTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              ItemSperator.halfVertical(),
              Text(
                AppLocalizations.current.signupDescription,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SectionSeperator.vertical(),
              const SignUpForm(),
              const SignupTermsCheckbox(),
              ItemSperator.vertical(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async => await signupController.signup(),
                    child: Text(AppLocalizations.current.signUP)),
              ),
              SectionSeperator.vertical(),
              MyFormDivider(deviderText: AppLocalizations.current.orSignupWith),
              SectionSeperator.vertical(),
              const SoicalButtons(),
            ],
          )),
    );
  }
}
