import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smartFin/features/auth/data/models/user_model.dart';
import 'package:smartFin/features/auth/data/service/local/sqflite_auth.dart';
import 'package:smartFin/features/auth/data/service/remote/auth.dart';
import 'package:smartFin/generated/l10n.dart';
import 'package:uuid/uuid.dart';

class FirebaseAuthImpl implements Auth {
  final FirebaseAuth _auth;
  final SqfliteAuth sqfliteAuth;

  FirebaseAuthImpl(
    this._auth,
    this.sqfliteAuth,
  );

  @override
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential res = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = res.user;
    if (user == null) {
      throw AppLocalizations.current.userisNull;
    }

    final userModel = UserModel(
      email: email,
      uid: const Uuid().v1(),
      firebaseId: user.uid,
      fName: user.displayName?.split(' ').first ?? '',
      lName: user.displayName?.split(' ').last ?? '',
      userName: user.displayName ?? '',
      phoneNumber: user.phoneNumber ?? '',
      imageurl: user.photoURL ?? '',
    );
    return userModel;
  }

  @override
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print("🔄 Starting Google Sign-In...");
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    print("✅ Google Sign-In successful.");
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    print("🔄 Starting Firebase Sign-In...");
    await _auth.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Future<UserModel> signupWithEmailAndPassword(String fName, String lName,
      String userName, String email, String password) async {
    UserCredential res = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = res.user;
    if (user == null) {
      throw AppLocalizations.current.userisNull;
    }
    await user.updateDisplayName("$fName $lName");
    return UserModel(
      email: user.email ?? '',
      uid: const Uuid().v1(),
      firebaseId: user.uid,
      fName: fName,
      lName: lName,
      userName: userName,
      phoneNumber: user.phoneNumber ?? '',
      imageurl: user.photoURL ?? '',
    );
  }

  @override
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
