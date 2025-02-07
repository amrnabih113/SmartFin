import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smartFin/common/sepetarors/item_seperator.dart';
import 'package:smartFin/core/utils/validators/validation.dart';
import 'package:smartFin/features/auth/presentation/controller/signin_controller.dart';
import 'package:smartFin/features/auth/presentation/widgets/auth_text_feild.dart';
import 'package:smartFin/generated/l10n.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signInController = SignInController.instance;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    signInController.signinFormKey = formKey;
    return Form(
        key: formKey,
        child: Column(
          children: [
            AuthTextFeild(
              title: AppLocalizations.current.email,
              icon: HugeIcons.strokeRoundedMail01,
              controller: signInController.emailController,
              validator: (value) => MyValidator.validateEmail(value),
            ),
            ItemSperator.vertical(),
            AuthTextFeild(
              title: AppLocalizations.current.password,
              icon: HugeIcons.strokeRoundedCirclePassword,
              controller: signInController.passwordController,
              isPassword: true,
              validator: (value) => MyValidator.validatePassword(value),
            ),
          ],
        ));
  }
}
