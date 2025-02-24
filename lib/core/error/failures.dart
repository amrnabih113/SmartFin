import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:smartFin/core/utils/exceptions/exceptions.dart';

/// Base class for handling failures.
 class Failure {
  final String message;

  Failure({this.message = 'An unexpected error occurred!'});
}

/// **🔹 General Failures**
class UnknownFailure extends Failure {
  UnknownFailure({super.message = 'An unknown error occurred'});
}

/// **🔹 Server Failure (e.g., API errors)**
class ServerFailure extends Failure {

  ServerFailure(String string, {super.message = 'Server error occurred'});
}

/// **🔹 Database Failure (e.g., SQLite errors)**
class DatabaseFailure extends Failure {
  DatabaseFailure( {super.message = 'Database error occurred'});
}

/// **🔹 Network Failure (e.g., No internet connection)**
class NetworkFailure extends Failure {
  NetworkFailure({super.message = 'No internet connection'});
}

/// **🔹 Platform Failure (e.g., Flutter platform-specific errors)**
class PlatformFailure extends Failure {
  PlatformFailure({super.message = 'Platform error occurred'});
}

/// **🔹 Timeout Failure (e.g., API request timeout)**
class TimeoutFailure extends Failure {
  TimeoutFailure({super.message = 'Request timed out'});
}

/// **🔹 Unauthorized Failure (e.g., Authentication errors)**
class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({super.message = 'Unauthorized request'});
}

/// **🔹 Authentication Failures (e.g., Firebase auth errors)**
class AuthFailure extends Failure {
  AuthFailure({required super.message});

  /// Converts Firebase Auth error codes into meaningful messages.
  factory AuthFailure.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return AuthFailure(message: 'The email address is already registered. Please use a different email.');
      case 'invalid-email':
        return AuthFailure(message: 'The email address provided is invalid. Please enter a valid email.');
      case 'weak-password':
        return AuthFailure(message: 'The password is too weak. Please choose a stronger password.');
      case 'user-disabled':
        return AuthFailure(message: 'This user account has been disabled. Please contact support.');
      case 'user-not-found':
        return AuthFailure(message: 'Invalid login details. User not found.');
      case 'wrong-password':
      case 'invalid-password':
        return AuthFailure(message: 'Incorrect password. Please check your password and try again.');
      case 'INVALID_LOGIN_CREDENTIALS':
        return AuthFailure(message: 'Invalid login credentials. Please double-check your information.');
      case 'too-many-requests':
        return AuthFailure(message: 'Too many requests. Please try again later.');
      case 'invalid-argument':
        return AuthFailure(message: 'Invalid argument provided to the authentication method.');
      case 'invalid-phone-number':
        return AuthFailure(message: 'The provided phone number is invalid.');
      case 'operation-not-allowed':
        return AuthFailure(message: 'The sign-in provider is disabled for your Firebase project.');
      case 'session-cookie-expired':
        return AuthFailure(message: 'The Firebase session cookie has expired. Please sign in again.');
      case 'uid-already-exists':
        return AuthFailure(message: 'The provided user ID is already in use by another user.');
      case 'sign_in_failed':
        return AuthFailure(message: 'Sign-in failed. Please try again.');
      case 'network-request-failed':
        return AuthFailure(message: 'Network request failed. Please check your internet connection.');
      case 'internal-error':
        return AuthFailure(message: 'Internal error. Please try again later.');
      case 'invalid-verification-code':
        return AuthFailure(message: 'Invalid verification code. Please enter a valid code.');
      case 'invalid-verification-id':
        return AuthFailure(message: 'Invalid verification ID. Please request a new verification code.');
      case 'quota-exceeded':
        return AuthFailure(message: 'Quota exceeded. Please try again later.');
      default:
        return AuthFailure(message: 'Authentication error. Please try again.');
    }
  }
}

/// **🔹 Method to Map Exceptions to Failures**
Failure handleException(dynamic exception) {
  if (exception is SocketException) {
    return NetworkFailure(message: 'No internet connection. Please check your network.');
  } else if (exception is HttpException) {
    return ServerFailure('Server error', message: 'Server responded with an error.');
  } else if (exception is FormatException) {
    return ServerFailure('Server error',message: 'Invalid response format.');
  } else if (exception is TimeoutException) {
    return TimeoutFailure(message: 'The request timed out. Please try again.');
  } else if (exception is PlatformException) {
    return PlatformFailure(message: exception.message ?? 'A platform error occurred.');
  } else if (exception is MyExceptions) {
    return AuthFailure(message: exception.message);
  } else {
    return UnknownFailure(message: exception.toString());
  }
}
