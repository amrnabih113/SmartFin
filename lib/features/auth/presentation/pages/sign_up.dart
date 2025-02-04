import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/common/sepetarors/section_seperator.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/core/constants/sizes.dart';
import 'package:smartFin/core/utils/device/device_utility.dart';
import 'package:smartFin/core/utils/helpers/helper_functions.dart';
import 'package:smartFin/features/auth/presentation/widgets/auth_text_feild.dart';
import 'package:smartFin/features/auth/presentation/widgets/myform_divider.dart';
import 'package:smartFin/features/auth/presentation/widgets/signup_terms_checkbox.dart';
import 'package:smartFin/features/auth/presentation/widgets/social_container.dart';
import 'package:smartFin/generated/l10n.dart';
import 'package:hugeicons/hugeicons.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
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
              Form(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: AuthTextFeild(
                        title: AppLocalizations.current.firstName,
                        icon: HugeIcons.strokeRoundedUserAccount,
                      )),
                      ItemSperator.horizontal(),
                      Expanded(
                          child: AuthTextFeild(
                        title: AppLocalizations.current.secondName,
                        icon: HugeIcons.strokeRoundedUserAccount,
                      )),
                    ],
                  ),
                  ItemSperator.vertical(),
                  AuthTextFeild(
                    title: AppLocalizations.current.username,
                    icon: Iconsax.edit,
                  ),
                  ItemSperator.vertical(),
                  AuthTextFeild(
                    title: AppLocalizations.current.email,
                    icon: HugeIcons.strokeRoundedMail01,
                  ),
                  ItemSperator.vertical(),
                  const AuthTextFeild(
                    title: "Password",
                    icon: HugeIcons.strokeRoundedCirclePassword,
                    isPassword: true,
                  ),
                  const SignupTermsCheckbox(),
                  ItemSperator.vertical(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(AppLocalizations.current.signUP)),
                  ),
                  SectionSeperator.vertical(),
                  MyFormDivider(
                      deviderText: AppLocalizations.current.orSignupWith),
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
