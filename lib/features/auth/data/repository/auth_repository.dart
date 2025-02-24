import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/services.dart';
import 'package:smartFin/core/constants/texts.dart';
import 'package:smartFin/core/error/failures.dart';
import 'package:smartFin/core/local_storage/my_local_storage.dart';
import 'package:smartFin/core/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:smartFin/core/utils/exceptions/format_exceptions.dart';
import 'package:smartFin/core/utils/exceptions/platform_exceptions.dart';
import 'package:smartFin/features/auth/data/models/user_model.dart';
import 'package:smartFin/features/auth/data/service/local/sqflite_auth.dart';
import 'package:smartFin/features/auth/data/service/remote/auth.dart';
import 'package:smartFin/features/auth/data/service/remote/supabase/supabase_auth.dart';
import 'package:smartFin/features/auth/domain/repository/auth_repository.dart';
import 'package:smartFin/generated/l10n.dart';
import 'package:uuid/uuid.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Auth auth;
  final SqfliteAuth sqfliteAuth;
  final SupabaseAuth supabaseAuth;
  final MyLocalStorage localStorage;

  AuthRepositoryImpl(
      this.auth, this.sqfliteAuth, this.supabaseAuth, this.localStorage);

  @override
  Future<void> googleSignIn() async {
    try {
      await auth.signInWithGoogle();

      final firebase_auth.User? user =
          firebase_auth.FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Failure(message: AppLocalizations.current.userisNull);
      }

      final fullName = user.displayName ?? '';
      final nameParts = fullName.split(' ');
      final fName = nameParts.isNotEmpty ? nameParts.first : '';
      final lName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

      final UserModel userModel = UserModel(
        uid: const Uuid().v4(),
        firebaseId: user.uid,
        email: user.email ?? '',
        fName: fName,
        lName: lName,
        userName:
            fullName.isNotEmpty ? fullName : user.email?.split('@').first ?? '',
        phoneNumber: user.phoneNumber ?? '',
        imageurl: user.photoURL ?? '',
      );
      localStorage.saveData<String>(MyTexts.userId, user.uid);
      await sqfliteAuth.saveUser(userModel);
      await supabaseAuth.savesUserRecords(userModel);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on SocketException {
      throw Exception(AppLocalizations.current.internetConnectionError);
    } on FormatException {
      throw const MyFormatException();
    } catch (e) {
      throw Exception('Google Sign-In failed: ${e.toString()}');
    }
  }

  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await auth.signInWithEmailAndPassword(email, password);
      localStorage.saveData<String>(MyTexts.userId, user.uid);
      return user.uid;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on SocketException {
      throw Exception(AppLocalizations.current.internetConnectionError);
    } on FormatException {
      throw const MyFormatException();
    } on PlatformException catch (e) {
      throw MyPlatformException(e.message ?? "Platform exception").message;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await auth.signOut();
      localStorage.removeData(MyTexts.userId);
      await sqfliteAuth.removeUser();
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on SocketException {
      throw Exception(AppLocalizations.current.internetConnectionError);
    } on FormatException {
      throw const MyFormatException();
    } on PlatformException catch (e) {
      throw MyPlatformException(e.message ?? "Platform exception").message;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> signupWithEmailAndPassword(
    String firstName,
    String lastName,
    String userName,
    String email,
    String password,
  ) async {
    try {
      final user = await auth.signupWithEmailAndPassword(
        firstName,
        lastName,
        userName,
        email,
        password,
      );

      final UserModel userModel = UserModel(
        firebaseId: user.uid,
        uid: user.uid,
        email: user.email,
        fName: firstName,
        lName: lastName,
        userName: userName,
        phoneNumber: '',
        imageurl: '',
      );
      localStorage.saveData<String>(MyTexts.userId, user.uid);
      await sqfliteAuth.saveUser(userModel);
      await supabaseAuth.savesUserRecords(userModel);
      return user.uid;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on SocketException {
      throw Exception(AppLocalizations.current.internetConnectionError);
    } on FormatException {
      throw const MyFormatException();
    } on PlatformException catch (e) {
      throw MyPlatformException(e.message ?? "Platform exception").message;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await auth.resetPassword(email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on SocketException {
      throw Exception(AppLocalizations.current.internetConnectionError);
    } on FormatException {
      throw const MyFormatException();
    } on PlatformException catch (e) {
      throw MyPlatformException(e.message ?? "Platform exception").message;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
