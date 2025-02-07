import 'package:get/get.dart';
import 'package:smartFin/config/routing/screen_redirect.dart';
import 'package:smartFin/core/constants/images.dart';
import 'package:smartFin/features/auth/presentation/pages/sucssess_screen.dart';
import 'package:smartFin/generated/l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  final SupabaseClient supabaseClient;

  VerifyEmailController(this.supabaseClient);

  final user = Supabase.instance.client.auth.currentUser;

  checkEmailVerificationStatus() async {
    if (user != null && user!.emailConfirmedAt == null) {
      Get.off(() => SuccessScreen(
            image: MyImages.verifyEmailAnimation,
            title: AppLocalizations.current.yourAccountCreatedTitle,
            subtitle: AppLocalizations.current.yourAccountCreatedSubTitle,
            onPressed: () => ScreenRedirect.instance.screenRedirect(),
          ));
    }
  }
}

