import 'package:google_sign_in/google_sign_in.dart';
import 'package:smartFin/features/auth/data/models/user_model.dart';
import 'package:smartFin/features/auth/data/service/supabase_auth.dart';
import 'package:smartFin/generated/l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthImpl implements SupabaseAuth {
  final SupabaseClient supabase;

  SupabaseAuthImpl(this.supabase);
  final auth = Supabase.instance.client.auth;
  @override
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    final AuthResponse res = await auth.signInWithPassword(
      email: email,
      password: password,
    );
    final User? user = res.user;
    if (user == null) {
      throw AppLocalizations.current.userisNull;
    }
    return UserModel(
      email: email,
      uid: user.id,
      fName: user.userMetadata?['f_name'] ?? '',
      lName: user.userMetadata?['l_name'] ?? '',
      userName: user.userMetadata?['username'] ?? '',
      phoneNumber: user.userMetadata?['phone_number'] ?? '',
      imageurl: user.userMetadata?['imageUrl'] ?? '',
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      const webClientId =
          '88936723358-424bl1anrnnk6eogpaofrdnbqog5jps6.apps.googleusercontent.com';

      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: webClientId,
      );

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw AppLocalizations.current.googleSignInCancelled;
      }

      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (idToken == null || accessToken == null) {
        throw AppLocalizations.current.googleSignInFailed;
      }

      final res = await auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      if (res.user == null) {
        throw AppLocalizations.current.userisNull;
      }
    } catch (e) {
      throw Exception('${AppLocalizations.current.googleSignInFailed}: $e');
    }
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Future<UserModel> signupWithEmailAndPassword(String fName, String lName,
      String userName, String email, String password) async {
    final AuthResponse res =
        await auth.signUp(email: email, password: password, data: {
      'f_name': fName,
      'l_name': lName,
      'username': userName,
    });
    final User? user = res.user;
    if (user == null) {
      throw AppLocalizations.current.userisNull;
    }
    return UserModel(
      email: user.email ?? '',
      uid: user.id,
      fName: fName,
      lName: lName,
      userName: userName,
      phoneNumber: user.userMetadata?['phone_number'] ?? '',
      imageurl: user.userMetadata?['imageUrl'] ?? '',
    );
  }

  @override
  Future<void> resetPassword(String email) async {
    print('pre auth.resetPasswordForEmail===============================');
    await auth.resetPasswordForEmail(email);
    print('after auth.resetPasswordForEmail===============================');
  }
}
