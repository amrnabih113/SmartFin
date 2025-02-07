// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Welcome Back!`
  String get signInTitle {
    return Intl.message(
      'Welcome Back!',
      name: 'signInTitle',
      desc: '',
      args: [],
    );
  }

  /// `Take Control of Your Budgets with SmartFin!`
  String get signInDescription {
    return Intl.message(
      'Take Control of Your Budgets with SmartFin!',
      name: 'signInDescription',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message(
      'Remember me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get ForgetPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'ForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Or Sign In With`
  String get orSignInWith {
    return Intl.message(
      'Or Sign In With',
      name: 'orSignInWith',
      desc: '',
      args: [],
    );
  }

  /// `Or Sign Up With`
  String get orSignupWith {
    return Intl.message(
      'Or Sign Up With',
      name: 'orSignupWith',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUP {
    return Intl.message(
      'Sign Up',
      name: 'signUP',
      desc: '',
      args: [],
    );
  }

  /// `Let's Get Started!`
  String get signupTitle {
    return Intl.message(
      'Let\'s Get Started!',
      name: 'signupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create your Acount now!`
  String get signupDescription {
    return Intl.message(
      'Create your Acount now!',
      name: 'signupDescription',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get secondName {
    return Intl.message(
      'Last Name',
      name: 'secondName',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `I agree to`
  String get iAgreeTo {
    return Intl.message(
      'I agree to',
      name: 'iAgreeTo',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message(
      'and',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get termsOfUse {
    return Intl.message(
      'Terms of Use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `User is Null`
  String get userisNull {
    return Intl.message(
      'User is Null',
      name: 'userisNull',
      desc: '',
      args: [],
    );
  }

  /// `User cancelled sign-in.`
  String get userCancelledSignIn {
    return Intl.message(
      'User cancelled sign-in.',
      name: 'userCancelledSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection.`
  String get internetConnectionError {
    return Intl.message(
      'Please check your internet connection.',
      name: 'internetConnectionError',
      desc: '',
      args: [],
    );
  }

  /// `Logging in...`
  String get loggingIn {
    return Intl.message(
      'Logging in...',
      name: 'loggingIn',
      desc: '',
      args: [],
    );
  }

  /// `Oh Snap!`
  String get ohSnap {
    return Intl.message(
      'Oh Snap!',
      name: 'ohSnap',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Login failed. Please check your credentials.`
  String get logInFailedTryAgain {
    return Intl.message(
      'Login failed. Please check your credentials.',
      name: 'logInFailedTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Sign up failed. Please check your credentials.`
  String get signUpFailedTryAgain {
    return Intl.message(
      'Sign up failed. Please check your credentials.',
      name: 'signUpFailedTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Sign up successful. Please check your e-mail for activation link.`
  String get signUpSuccessful {
    return Intl.message(
      'Sign up successful. Please check your e-mail for activation link.',
      name: 'signUpSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Google Sign-In failed. Try again.`
  String get googleSignInFailed {
    return Intl.message(
      'Google Sign-In failed. Try again.',
      name: 'googleSignInFailed',
      desc: '',
      args: [],
    );
  }

  /// `Google Sign-In cancelled.`
  String get googleSignInCancelled {
    return Intl.message(
      'Google Sign-In cancelled.',
      name: 'googleSignInCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Signing you up...`
  String get signingUp {
    return Intl.message(
      'Signing you up...',
      name: 'signingUp',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again later.`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong. Please try again later.',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `You must agree to our Terms of Use and Privacy Policy.`
  String get agreeTerms {
    return Intl.message(
      'You must agree to our Terms of Use and Privacy Policy.',
      name: 'agreeTerms',
      desc: '',
      args: [],
    );
  }

  /// `Email already exists. Please use a different email.`
  String get emailAlreadyExists {
    return Intl.message(
      'Email already exists. Please use a different email.',
      name: 'emailAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Reset your Password`
  String get resetPassword {
    return Intl.message(
      'Reset your Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgetPasswordTitle {
    return Intl.message(
      'Forgot Password?',
      name: 'forgetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address to receive instructions for resetting your password.`
  String get forgetPasswordDescription {
    return Intl.message(
      'Enter your email address to receive instructions for resetting your password.',
      name: 'forgetPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successful. Please check your e-mail for new password.`
  String get resetPasswordSuccessful {
    return Intl.message(
      'Password reset successful. Please check your e-mail for new password.',
      name: 'resetPasswordSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Password reset failed. Please try again later.`
  String get resetPasswordFailed {
    return Intl.message(
      'Password reset failed. Please try again later.',
      name: 'resetPasswordFailed',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Processing your request...`
  String get processingYourRequest {
    return Intl.message(
      'Processing your request...',
      name: 'processingYourRequest',
      desc: '',
      args: [],
    );
  }

  /// `Email sent successfully.`
  String get emailSentTitle {
    return Intl.message(
      'Email sent successfully.',
      name: 'emailSentTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please check your e-mail for instructions on how to reset your password.`
  String get resetPasswordEmailSentDescription {
    return Intl.message(
      'Please check your e-mail for instructions on how to reset your password.',
      name: 'resetPasswordEmailSentDescription',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Change your password`
  String get changeYourPasswordTitle {
    return Intl.message(
      'Change your password',
      name: 'changeYourPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.`
  String get changeYourPasswordSubTitle {
    return Intl.message(
      'Your Account Security is Our Priority! We\'ve Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.',
      name: 'changeYourPasswordSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Resend Email`
  String get resendEmail {
    return Intl.message(
      'Resend Email',
      name: 'resendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Email`
  String get confirmEmail {
    return Intl.message(
      'Confirm Email',
      name: 'confirmEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please check you email to vreify it so you can enjoy controlling your budgets`
  String get confirmEmailSubtitle {
    return Intl.message(
      'Please check you email to vreify it so you can enjoy controlling your budgets',
      name: 'confirmEmailSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Your account successfully created!`
  String get yourAccountCreatedTitle {
    return Intl.message(
      'Your account successfully created!',
      name: 'yourAccountCreatedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!`
  String get yourAccountCreatedSubTitle {
    return Intl.message(
      'Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!',
      name: 'yourAccountCreatedSubTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
