import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/core/utils/validators/validation.dart';
import 'package:smartFin/features/auth/presentation/controller/signup_controller.dart';
import 'package:smartFin/features/auth/presentation/widgets/auth_text_feild.dart';
import 'package:smartFin/generated/l10n.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signUpController = SignUpcontroller.instance;
    return Form(
        key: signUpController.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: AuthTextFeild(
                  title: AppLocalizations.current.firstName,
                  icon: HugeIcons.strokeRoundedUserAccount,
                  controller: signUpController.fNameController,
                  validator: (value) => MyValidator.validateEmptyText(
                      AppLocalizations.current.firstName, value),
                )),
                ItemSperator.horizontal(),
                Expanded(
                    child: AuthTextFeild(
                  title: AppLocalizations.current.secondName,
                  icon: HugeIcons.strokeRoundedUserAccount,
                  controller: signUpController.lNameController,
                  validator: (value) => MyValidator.validateEmptyText(
                      AppLocalizations.current.secondName, value),
                )),
              ],
            ),
            ItemSperator.vertical(),
            AuthTextFeild(
              title: AppLocalizations.current.username,
              icon: Iconsax.edit,
              controller: signUpController.userNameController,
              validator: (value) => MyValidator.validateEmptyText(
                  AppLocalizations.current.username, value),
            ),
            ItemSperator.vertical(),
            AuthTextFeild(
              title: AppLocalizations.current.email,
              icon: HugeIcons.strokeRoundedMail01,
              controller: signUpController.emailController,
              validator: (value) => MyValidator.validateEmail(value),
            ),
            ItemSperator.vertical(),
            AuthTextFeild(
              title: AppLocalizations.current.password,
              icon: HugeIcons.strokeRoundedCirclePassword,
              isPassword: true,
              controller: signUpController.passwordController,
              validator: (value) => MyValidator.validatePassword(value),
            ),
          ],
        ));
  }
}
