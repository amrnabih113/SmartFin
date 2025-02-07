import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:smartFin/core/error/failures.dart';
import 'package:smartFin/features/auth/data/repository/auth_repository.dart';
import 'package:smartFin/features/auth/data/service/supabase_auth.dart';
import 'package:smartFin/generated/l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseAuth supabaseAuth;

  AuthRepositoryImpl(this.supabaseAuth);

  @override
  Future<Either<Failure, void>> googleSignIn() async {
    try {
      await supabaseAuth.signInWithGoogle();
      return const Right(null);
    } on AuthException catch (e) {
      return Left(Failure(message: e.message));
    } on SocketException {
      return Left(
          Failure(message: AppLocalizations.current.internetConnectionError));
    }
  }

  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final user =
          await supabaseAuth.signInWithEmailAndPassword(email, password);
      return Right(user.uid);
    } on AuthException catch (e) {
      return Left(Failure(message: e.message));
    } on SocketException {
      return Left(
          Failure(message: AppLocalizations.current.internetConnectionError));
    } on FormatException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await supabaseAuth.signOut();
      return const Right(null);
    } on AuthException catch (e) {
      return Left(Failure(message: e.message));
    } on SocketException {
      return Left(
          Failure(message: AppLocalizations.current.internetConnectionError));
    }
  }

  @override
  Future<Either<Failure, String>> signupWithEmailAndPassword(
    String firstName,
    String lastName,
    String userName,
    String email,
    String password,
  ) async {
    try {
      final user = await supabaseAuth.signupWithEmailAndPassword(
        firstName,
        lastName,
        userName,
        email,
        password,
      );
      print(user.toJson());
      return Right(user.uid);
    } on AuthException catch (e) {
      return Left(Failure(message: e.message));
    } on SocketException {
      return Left(
          Failure(message: AppLocalizations.current.internetConnectionError));
    } on FormatException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      print(
          '==========pre auth.resetPasswordForEmail===============================');
      await supabaseAuth.resetPassword(email);
      print(
          '==================after auth.resetPasswordForEmail===============================');
      return const Right(null);
    } on AuthException catch (e) {
      return Left(Failure(message: e.message));
    } on SocketException {
      return Left(
          Failure(message: AppLocalizations.current.internetConnectionError));
    }
  }
}
