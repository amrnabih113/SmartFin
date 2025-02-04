import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/sepetarors/section_seperator.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/device/device_utility.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/auth/presentation/pages/sign_up.dart';
import 'package:smartFin/features/auth/presentation/widgets/auth_text_feild.dart';
import 'package:smartFin/features/auth/presentation/widgets/myform_divider.dart';
import 'package:smartFin/features/auth/presentation/widgets/social_container.dart';
import 'package:smartFin/generated/l10n.dart';
import 'package:hugeicons/hugeicons.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
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
              Form(
                  child: Column(
                children: [
                  const AuthTextFeild(
                    title: 'E-mail',
                    icon: HugeIcons.strokeRoundedMail01,
                  ),
                  ItemSperator.vertical(),
                  const AuthTextFeild(
                    title: "Password",
                    icon: HugeIcons.strokeRoundedCirclePassword,
                    isPassword: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (bool? value) {},
                          ),
                          Text(AppLocalizations.current.rememberMe)
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(AppLocalizations.current.ForgetPassword),
                      )
                    ],
                  ),
                  ItemSperator.vertical(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(AppLocalizations.current.signIn)),
                  ),
                  ItemSperator.vertical(),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => Get.to(() => const SignUp()),
                        child: Text(AppLocalizations.current.signUP)),
                  ),
                  SectionSeperator.vertical(),
                  MyFormDivider(
                      deviderText: AppLocalizations.current.orSignInWith),
                  SectionSeperator.vertical(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialContainer(
                          height: 50,
                          width: 50,
                          child: Image.asset(MyImages.googleLogo)),
                      SectionSeperator.horizontal(),
                      SocialContainer(
                          height: 50,
                          width: 50,
                          child: Image.asset(MyImages.facebookLogo)),
                    ],
                  )
                ],
              ))
            ],
          )),
    );
  }
}
